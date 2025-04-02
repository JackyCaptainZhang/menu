import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../screens/dish_detail_screen.dart';
import '../providers/language_provider.dart';

class CategoryCard extends StatefulWidget {
  final Category category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final currentLang = languageProvider.currentLanguage;

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.category.name[currentLang]!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            trailing: IconButton(
              icon: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ),
          if (isExpanded)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.category.subcategories.length,
              itemBuilder: (context, index) {
                final subcategory = widget.category.subcategories[index];
                return SubcategorySection(subcategory: subcategory);
              },
            ),
        ],
      ),
    );
  }
}

class SubcategorySection extends StatelessWidget {
  final Subcategory subcategory;

  const SubcategorySection({
    super.key,
    required this.subcategory,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DishDetailScreen(dish: dish),
                      ),
                    );
                  },
                  backgroundColor: dish.status == 'unlocked'
                      ? Theme.of(context).colorScheme.primaryContainer
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