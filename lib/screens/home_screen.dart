import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../widgets/category_card.dart';
import '../providers/language_provider.dart';
import '../providers/menu_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _expandedCategoryId;

  void _handleCategoryTap(String categoryId) {
    setState(() {
      if (_expandedCategoryId == categoryId) {
        _expandedCategoryId = null;
      } else {
        _expandedCategoryId = categoryId;
      }
    });
  }

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
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        final currentLang = languageProvider.currentLanguage;
        return Consumer<MenuProvider>(
          builder: (context, menuProvider, child) {
            if (menuProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (menuProvider.error != null) {
              return Center(
                child: Text(
                  'Error loading menu data: ${menuProvider.error}',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            return Column(
              children: [
                _buildStatusLegend(context, currentLang),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: menuProvider.menuData.length,
                    itemBuilder: (context, index) {
                      final category = menuProvider.menuData[index];
                      return CategoryCard(
                        category: category,
                        isExpanded: _expandedCategoryId == category.id,
                        onTap: () => _handleCategoryTap(category.id),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
} 