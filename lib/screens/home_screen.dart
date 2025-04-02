import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_model.dart';
import '../widgets/category_card.dart';
import '../providers/language_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoryController(),
      child: Consumer<CategoryController>(
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
    );
  }
} 