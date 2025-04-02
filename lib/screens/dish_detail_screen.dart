import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../providers/language_provider.dart';

class DishDetailScreen extends StatelessWidget {
  final Dish dish;

  const DishDetailScreen({
    super.key,
    required this.dish,
  });

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final currentLang = languageProvider.currentLanguage;

    return Scaffold(
      appBar: AppBar(
        title: Text(dish.name[currentLang]!),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 菜品名称和状态
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${dish.name[currentLang]} ${dish.emoji ?? ''}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Chip(
                  label: Text(
                    getDishStatus(dish.status, currentLang),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: dish.status == 'unlocked'
                      ? Colors.green
                      : Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 评分（如果存在）
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
                    '${dish.rating}/100',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.amber[700],
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],

            // 另一种语言的名称
            if (currentLang == 'zh' && dish.name['en'] != null) ...[
              Text(
                dish.name['en']!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 24),
            ],

            // 备注信息
            if (dish.notes != null) ...[
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
    );
  }
} 