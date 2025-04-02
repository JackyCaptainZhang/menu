import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../widgets/category_card.dart';
import '../providers/language_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildStatusLegend(BuildContext context, String currentLang) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          Chip(
            label: Text(
              currentLang == 'zh' ? '已解锁' : 'Unlocked',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
          Chip(
            label: Text(
              currentLang == 'zh' ? '测试中' : 'Testing',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.orange,
          ),
          Chip(
            label: Text(
              currentLang == 'zh' ? '待解锁' : 'Locked',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryController(),
      child: Consumer<CategoryController>(
        builder: (context, controller, child) {
          return Consumer<LanguageProvider>(
            builder: (context, languageProvider, child) {
              final currentLang = languageProvider.currentLanguage;
              return Column(
                children: [
                  _buildStatusLegend(context, currentLang),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: menuData.length,
                      itemBuilder: (context, index) {
                        final category = menuData[index];
                        return CategoryCard(
                          category: category,
                          controller: controller,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
} 