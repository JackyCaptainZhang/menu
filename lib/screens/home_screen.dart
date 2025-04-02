import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('乐乐&袁宝の美味Menu 😋'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // TODO: Implement language switching
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: menuData.length,
        itemBuilder: (context, index) {
          final category = menuData[index];
          return CategoryCard(category: category);
        },
      ),
    );
  }
} 