import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../providers/language_provider.dart';

// Add a controller to manage expanded categories
class CategoryController extends ChangeNotifier {
  String? _expandedCategoryId;

  String? get expandedCategoryId => _expandedCategoryId;

  void toggleCategory(String categoryId) {
    if (_expandedCategoryId == categoryId) {
      _expandedCategoryId = null;
    } else {
      _expandedCategoryId = categoryId;
    }
    notifyListeners();
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final CategoryController controller;

  const CategoryCard({
    super.key,
    required this.category,
    required this.controller,
  });

  void _showDishDetails(BuildContext context, Dish dish) {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer<LanguageProvider>(
          builder: (context, languageProvider, child) {
            final currentLang = languageProvider.currentLanguage;
            return AlertDialog(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${dish.name[currentLang]} ${dish.emoji ?? ''}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Chip(
                    label: Text(
                      getDishStatus(dish.status, currentLang),
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: getDishStatusColor(dish.status),
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (dish.rating != null) ...[
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            currentLang == 'zh' ? '${dish.rating}分' : '${dish.rating}/100',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.amber[700],
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (dish.notes != null && dish.notes![currentLang] != null) ...[
                      Text(
                        currentLang == 'zh' ? '备注' : 'Notes',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          dish.notes![currentLang]!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(currentLang == 'zh' ? '关闭' : 'Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final currentLang = languageProvider.currentLanguage;
    final isExpanded = controller.expandedCategoryId == category.id;

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              category.name[currentLang]!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            trailing: IconButton(
              icon: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                controller.toggleCategory(category.id);
              },
            ),
          ),
          if (isExpanded)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: category.subcategories.length,
              itemBuilder: (context, index) {
                final subcategory = category.subcategories[index];
                return SubcategorySection(
                  subcategory: subcategory,
                  onDishTap: _showDishDetails,
                );
              },
            ),
        ],
      ),
    );
  }
}

class SubcategorySection extends StatelessWidget {
  final Subcategory subcategory;
  final void Function(BuildContext context, Dish dish) onDishTap;

  const SubcategorySection({
    super.key,
    required this.subcategory,
    required this.onDishTap,
  });

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final currentLang = languageProvider.currentLanguage;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subcategory.name[currentLang]!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (() {
              final sortedDishes = subcategory.dishes.toList()
                ..sort((a, b) {
                  if (a.status == 'locked' && b.status != 'locked') return 1;
                  if (a.status != 'locked' && b.status == 'locked') return -1;
                  return 0;
                });
              return sortedDishes.map((dish) {
                return ActionChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(dish.name[currentLang]!),
                      if (dish.emoji != null) ...[
                        const SizedBox(width: 4),
                        Text(dish.emoji!),
                      ],
                      if (dish.rating != null) ...[
                        const SizedBox(width: 4),
                        Text('⭐${dish.rating}'),
                      ],
                    ],
                  ),
                  onPressed: () => onDishTap(context, dish),
                  backgroundColor: dish.status == 'unlocked'
                      ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7)
                      : dish.status == 'testing'
                          ? Colors.orange.withOpacity(0.2)
                          : null,
                );
              }).toList();
            })(),
          ),
        ],
      ),
    );
  }
} 