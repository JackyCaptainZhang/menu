import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/language_provider.dart';
import '../main.dart';

class RecipeTipsScreen extends StatelessWidget {
  const RecipeTipsScreen({super.key});

  void _showEditDialog(BuildContext context, String collection, String docId, Map<String, dynamic> data, bool isZh) {
    final contentKey = collection == 'ingredient_tips' ? 'description' : 'recipe';
    final nameZhController = TextEditingController(text: data['name']?['zh'] ?? '');
    final nameEnController = TextEditingController(text: data['name']?['en'] ?? '');
    final contentZhController = TextEditingController(text: data[contentKey]?['zh'] ?? '');
    final contentEnController = TextEditingController(text: data[contentKey]?['en'] ?? '');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isZh ? '编辑' : 'Edit'),
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
                controller: contentZhController,
                decoration: InputDecoration(labelText: collection == 'ingredient_tips' ? '描述（中文）' : '配方（中文）'),
                maxLines: 3,
              ),
              TextField(
                controller: contentEnController,
                decoration: InputDecoration(labelText: collection == 'ingredient_tips' ? 'Description (EN)' : 'Recipe (EN)'),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(isZh ? '取消' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final updateData = {
                'name': {
                  'zh': nameZhController.text.trim(),
                  'en': nameEnController.text.trim(),
                },
                contentKey: {
                  'zh': contentZhController.text.trim(),
                  'en': contentEnController.text.trim(),
                },
              };
              await FirebaseFirestore.instance.collection(collection).doc(docId).update(updateData);
              Navigator.of(context).pop();
            },
            child: Text(isZh ? '保存' : 'Save'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, String collection, String docId, bool isZh) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isZh ? '确认删除' : 'Confirm Delete'),
        content: Text(isZh ? '确定要删除这条记录吗？' : 'Delete this record?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(isZh ? '取消' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseFirestore.instance.collection(collection).doc(docId).delete();
              Navigator.of(context).pop();
            },
            child: Text(isZh ? '删除' : 'Delete'),
          ),
        ],
      ),
    );
  }

  void _showAddDialog(BuildContext context, String collection, bool isZh) {
    final nameZhController = TextEditingController();
    final nameEnController = TextEditingController();
    final contentZhController = TextEditingController();
    final contentEnController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isZh ? '添加' : 'Add'),
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
                controller: contentZhController,
                decoration: InputDecoration(labelText: collection == 'ingredient_tips' ? '描述（中文）' : '配方（中文）'),
                maxLines: 3,
              ),
              TextField(
                controller: contentEnController,
                decoration: InputDecoration(labelText: collection == 'ingredient_tips' ? 'Description (EN)' : 'Recipe (EN)'),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(isZh ? '取消' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final data = {
                'name': {
                  'zh': nameZhController.text.trim(),
                  'en': nameEnController.text.trim(),
                },
                collection == 'ingredient_tips' ? 'description' : 'recipe': {
                  'zh': contentZhController.text.trim(),
                  'en': contentEnController.text.trim(),
                },
              };
              String docId = nameZhController.text.trim().replaceAll(RegExp(r'[.#$/\[\]]'), '_');
              if (docId.isEmpty) return;
              await FirebaseFirestore.instance.collection(collection).doc(docId).set(data);
              Navigator.of(context).pop();
            },
            child: Text(isZh ? '保存' : 'Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isZh = languageProvider.currentLanguage == 'zh';
    final isLoggedIn = Provider.of<AppAuthProvider>(context).user != null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isZh ? '食材选择' : 'Ingredient Selection',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          if (isLoggedIn)
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.pink),
              tooltip: isZh ? '添加' : 'Add',
              onPressed: () => _showAddDialog(context, 'ingredient_tips', isZh),
            ),
          const SizedBox(height: 16),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('ingredient_tips').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(isZh ? '暂无数据' : 'No data'),
                );
              }
              final tips = snapshot.data!.docs;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tips.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final name = data['name'] ?? {};
                  final description = data['description'] ?? {};
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name[isZh ? 'zh' : 'en'] ?? '',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              description[isZh ? 'zh' : 'en'] ?? '',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            if (isLoggedIn)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.orange),
                                    tooltip: isZh ? '编辑' : 'Edit',
                                    onPressed: () => _showEditDialog(context, 'ingredient_tips', doc.id, data, isZh),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    tooltip: isZh ? '删除' : 'Delete',
                                    onPressed: () => _confirmDelete(context, 'ingredient_tips', doc.id, isZh),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                isZh ? '绝密🤐调料配比' : 'Secret🤐Sauce Ratios',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const Text(' 🤫'),
              if (isLoggedIn)
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.pink),
                  tooltip: isZh ? '添加' : 'Add',
                  onPressed: () => _showAddDialog(context, 'sauce_recipes', isZh),
                ),
            ],
          ),
          const SizedBox(height: 16),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('sauce_recipes').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(isZh ? '暂无数据' : 'No data'),
                );
              }
              final recipes = snapshot.data!.docs;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: recipes.map((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final name = data['name'] ?? {};
                  final recipe = data['recipe'] ?? {};
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name[isZh ? 'zh' : 'en'] ?? '',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              recipe[isZh ? 'zh' : 'en'] ?? '',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.left,
                            ),
                            if (isLoggedIn)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.orange),
                                    tooltip: isZh ? '编辑' : 'Edit',
                                    onPressed: () => _showEditDialog(context, 'sauce_recipes', doc.id, data, isZh),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.red),
                                    tooltip: isZh ? '删除' : 'Delete',
                                    onPressed: () => _confirmDelete(context, 'sauce_recipes', doc.id, isZh),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
} 