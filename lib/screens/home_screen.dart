import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../widgets/category_card.dart';
import '../providers/language_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isZh = languageProvider.currentLanguage == 'zh';

    return ChangeNotifierProvider(
      create: (_) => CategoryController(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(isZh ? '乐乐&袁宝の美味Menu 😋' : 'Jacky & Yuan\'s Menu 😋'),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                languageProvider.toggleLanguage();
              },
            ),
          ],
        ),
        body: Consumer<CategoryController>(
          builder: (context, controller, child) {
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: menuData.length,
              itemBuilder: (context, index) {
                final category = menuData[index];
                return CategoryCard(
                  category: category,
                  controller: controller,
                );
              },
            );
          },
        ),
      ),
    );
  }
} 