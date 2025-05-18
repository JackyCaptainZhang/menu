import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../providers/language_provider.dart';
import '../main.dart';
import '../providers/menu_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  final bool isExpanded;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.isExpanded,
    required this.onTap,
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

    if (widget.isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(CategoryCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showDishDetails(BuildContext context, Category category, Subcategory subcategory, Dish dish) {
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);
    final isLoggedIn = Provider.of<AppAuthProvider>(context, listen: false).user != null;
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
                if (isLoggedIn) ...[
                  TextButton.icon(
                    icon: const Icon(Icons.edit, color: Colors.orange),
                    label: Text(currentLang == 'zh' ? '编辑' : 'Edit'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      SubcategorySection(subcategory: subcategory, onDishTap: (ctx, cat, sub, dish) => _showDishDetails(ctx, cat, sub, dish))
                        ._showDishForm(
                          context,
                          dish: dish,
                          categoryId: category.id,
                          categoryName: category.name,
                          subcategoryId: subcategory.id,
                          subcategoryName: subcategory.name,
                        );
                    },
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    label: Text(currentLang == 'zh' ? '删除' : 'Delete'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      SubcategorySection(subcategory: subcategory, onDishTap: (ctx, cat, sub, dish) => _showDishDetails(ctx, cat, sub, dish))
                        ._confirmDeleteDish(context, dish);
                    },
                  ),
                ],
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
            onTap: widget.onTap,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                title: Text(
                  widget.category.name[currentLang]!,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: widget.isExpanded ? FontWeight.bold : null,
                    color: widget.isExpanded 
                      ? theme.colorScheme.primary 
                      : theme.colorScheme.onSurface,
                  ),
                ),
                trailing: RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    Icons.expand_more,
                    size: 28,
                    color: widget.isExpanded 
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
                          onDishTap: (ctx, cat, sub, dish) => _showDishDetails(ctx, cat, sub, dish),
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
  final void Function(BuildContext context, Category category, Subcategory subcategory, Dish dish) onDishTap;

  const SubcategorySection({
    super.key,
    required this.subcategory,
    required this.onDishTap,
  });

  void _showDishForm(BuildContext context, {Dish? dish, required String categoryId, required Map<String, String> categoryName, required String subcategoryId, required Map<String, String> subcategoryName}) {
    final isEdit = dish != null;
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    final currentLang = langProvider.currentLanguage;
    final nameZhController = TextEditingController(text: isEdit ? dish!.name['zh'] : '');
    final nameEnController = TextEditingController(text: isEdit ? dish!.name['en'] : '');
    final emojiController = TextEditingController(text: isEdit ? dish!.emoji ?? '' : '');
    final notesZhController = TextEditingController(text: isEdit ? (dish!.notes?['zh'] ?? '') : '');
    final notesEnController = TextEditingController(text: isEdit ? (dish!.notes?['en'] ?? '') : '');
    final ratingController = TextEditingController(text: isEdit && dish!.rating != null ? dish!.rating.toString() : '');
    String status = isEdit ? dish!.status : 'locked';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEdit ? (currentLang == 'zh' ? '编辑菜品' : 'Edit Dish') : (currentLang == 'zh' ? '添加菜品' : 'Add Dish')),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameZhController,
                  decoration: const InputDecoration(labelText: '中文名'),
                ),
                TextField(
                  controller: nameEnController,
                  decoration: const InputDecoration(labelText: '英文名'),
                ),
                TextField(
                  controller: emojiController,
                  decoration: const InputDecoration(labelText: 'Emoji'),
                ),
                DropdownButtonFormField<String>(
                  value: status,
                  items: const [
                    DropdownMenuItem(value: 'unlocked', child: Text('已解锁/Unlocked')),
                    DropdownMenuItem(value: 'testing', child: Text('测试中/Testing')),
                    DropdownMenuItem(value: 'locked', child: Text('待解锁/Locked')),
                  ],
                  onChanged: (v) => status = v!,
                  decoration: const InputDecoration(labelText: '状态/Status'),
                ),
                TextField(
                  controller: notesZhController,
                  decoration: const InputDecoration(labelText: '备注（中文）'),
                  maxLines: 4,
                ),
                TextField(
                  controller: notesEnController,
                  decoration: const InputDecoration(labelText: 'Notes (EN)'),
                  maxLines: 4,
                ),
                TextField(
                  controller: ratingController,
                  decoration: const InputDecoration(labelText: '评分（0-100，可选）'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(currentLang == 'zh' ? '取消' : 'Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = {
                  'zh': nameZhController.text.trim(),
                  'en': nameEnController.text.trim(),
                };
                final notes = {
                  'zh': notesZhController.text.trim(),
                  'en': notesEnController.text.trim(),
                };
                final rating = int.tryParse(ratingController.text.trim());
                final dishId = isEdit ? dish!.id : name['zh']!;
                final newDish = Dish(
                  id: dishId,
                  name: name,
                  status: status,
                  emoji: emojiController.text.trim(),
                  notes: notes,
                  rating: rating,
                );
                final menuProvider = Provider.of<MenuProvider>(context, listen: false);
                final db = FirebaseFirestore.instance.collection('dishes');
                final data = {
                  'name': name,
                  'status': status,
                  'emoji': emojiController.text.trim(),
                  'notes': notes,
                  'rating': rating,
                  'categoryId': categoryId,
                  'categoryName': categoryName,
                  'subcategoryName': subcategoryName,
                };
                if (isEdit) {
                  await db.doc(dishId).update(data);
                } else {
                  await db.doc(dishId).set(data);
                }
                Navigator.of(context).pop();
              },
              child: Text(currentLang == 'zh' ? '保存' : 'Save'),
            ),
          ],
        );
      },
    );
  }

  void _confirmDeleteDish(BuildContext context, Dish dish) {
    final langProvider = Provider.of<LanguageProvider>(context, listen: false);
    final currentLang = langProvider.currentLanguage;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(currentLang == 'zh' ? '确认删除' : 'Confirm Delete'),
        content: Text((currentLang == 'zh' ? '确定要删除菜品 ' : 'Delete dish ') + (dish.name[currentLang] ?? '') + '?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(currentLang == 'zh' ? '取消' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final db = FirebaseFirestore.instance.collection('dishes');
              await db.doc(dish.id).delete();
              Navigator.of(context).pop();
            },
            child: Text(currentLang == 'zh' ? '删除' : 'Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final currentLang = languageProvider.currentLanguage;
    final theme = Theme.of(context);
    final isLoggedIn = Provider.of<AppAuthProvider>(context, listen: false).user != null;
    final categoryCard = context.findAncestorWidgetOfExactType<CategoryCard>()!;
    final category = categoryCard.category;

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
              if (isLoggedIn)
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.pink),
                  tooltip: currentLang == 'zh' ? '添加菜品' : 'Add Dish',
                  onPressed: () {
                    _showDishForm(
                      context,
                      categoryId: category.id,
                      categoryName: category.name,
                      subcategoryId: subcategory.id,
                      subcategoryName: subcategory.name,
                    );
                  },
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
                  final priority = {
                    'unlocked': 0,
                    'testing': 1,
                    'locked': 2,
                  };
                  return priority[a.status]!.compareTo(priority[b.status]!);
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
                  onPressed: () => onDishTap(context, category, subcategory, dish),
                  backgroundColor: isLocked
                    ? theme.colorScheme.surface
                    : isTesting
                      ? Colors.orange.withOpacity(0.2)
                      : Colors.green.withOpacity(0.2),
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