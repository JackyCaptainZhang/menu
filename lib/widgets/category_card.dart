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

class CategoryCard extends StatefulWidget {
  final Category category;
  final CategoryController controller;

  const CategoryCard({
    super.key,
    required this.category,
    required this.controller,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<double> _elevation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _iconTurns = _controller.drive(
      Tween<double>(begin: 0, end: 0.5).chain(CurveTween(curve: Curves.easeInOutCubic)),
    );
    _heightFactor = _controller.drive(
      CurveTween(curve: Curves.easeInOutCubic),
    );
    _elevation = _controller.drive(
      Tween<double>(begin: 1, end: 3).chain(CurveTween(curve: Curves.easeInOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isExpanded => widget.controller.expandedCategoryId == widget.category.id;

  void _handleTap() {
    widget.controller.toggleCategory(widget.category.id);
  }

  @override
  void didUpdateWidget(CategoryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

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
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        elevation: _elevation.value,
        shadowColor: theme.colorScheme.shadow.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: _handleTap,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                title: Text(
                  widget.category.name[currentLang]!,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: _isExpanded ? FontWeight.bold : null,
                    color: _isExpanded 
                      ? theme.colorScheme.primary 
                      : theme.colorScheme.onSurface,
                  ),
                ),
                trailing: RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    Icons.expand_more,
                    size: 28,
                    color: _isExpanded 
                      ? theme.colorScheme.primary 
                      : theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
          ClipRect(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                );
              },
              child: Column(
                children: [
                  Divider(
                    height: 1,
                    color: theme.colorScheme.outline.withOpacity(0.2),
                  ),
                  Container(
                    color: theme.colorScheme.surface.withOpacity(0.5),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.category.subcategories.length,
                      itemBuilder: (context, index) {
                        final subcategory = widget.category.subcategories[index];
                        return SubcategorySection(
                          subcategory: subcategory,
                          onDishTap: _showDishDetails,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                subcategory.name[currentLang]!,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 12,
            children: (() {
              final sortedDishes = subcategory.dishes.toList()
                ..sort((a, b) {
                  if (a.status == 'locked' && b.status != 'locked') return 1;
                  if (a.status != 'locked' && b.status == 'locked') return -1;
                  return 0;
                });
              return sortedDishes.map((dish) {
                final isLocked = dish.status == 'locked';
                final isTesting = dish.status == 'testing';
                return ActionChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        dish.name[currentLang]!,
                        style: TextStyle(
                          color: isLocked 
                            ? theme.colorScheme.onSurface.withOpacity(0.5)
                            : theme.colorScheme.onSurface,
                        ),
                      ),
                      if (dish.emoji != null) ...[
                        const SizedBox(width: 4),
                        Text(dish.emoji!),
                      ],
                      if (dish.rating != null && !isLocked) ...[
                        const SizedBox(width: 4),
                        Text('⭐${dish.rating}'),
                      ],
                    ],
                  ),
                  onPressed: () => onDishTap(context, dish),
                  backgroundColor: isLocked
                    ? theme.colorScheme.surface
                    : isTesting
                      ? theme.colorScheme.tertiaryContainer.withOpacity(0.3)
                      : theme.colorScheme.primaryContainer.withOpacity(0.7),
                  elevation: isLocked ? 0 : 1,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: isLocked
                      ? BorderSide(color: theme.colorScheme.outline.withOpacity(0.2))
                      : BorderSide.none,
                  ),
                );
              }).toList();
            })(),
          ),
        ],
      ),
    );
  }
} 