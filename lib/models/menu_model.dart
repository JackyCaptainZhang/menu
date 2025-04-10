import 'package:flutter/material.dart';

class Dish {
  final String id;
  final Map<String, String> name;
  final String status;
  final String? emoji;
  final Map<String, String>? notes;
  final int? rating;

  const Dish({
    required this.id,
    required this.name,
    required this.status,
    this.emoji,
    this.notes,
    this.rating,
  });
}

class Subcategory {
  final String id;
  final Map<String, String> name;
  final List<Dish> dishes;

  const Subcategory({
    required this.id,
    required this.name,
    required this.dishes,
  });
}

class Category {
  final String id;
  final Map<String, String> name;
  final List<Subcategory> subcategories;

  const Category({
    required this.id,
    required this.name,
    required this.subcategories,
  });
}

String getDishStatus(String status, String language) {
  switch (status) {
    case 'unlocked':
      return language == 'zh' ? '已解锁' : 'Unlocked';
    case 'locked':
      return language == 'zh' ? '待解锁' : 'Locked';
    case 'testing':
      return language == 'zh' ? '测试中' : 'Testing';
    default:
      return status;
  }
}

Color getDishStatusColor(String status) {
  switch (status) {
    case 'unlocked':
      return Colors.green;
    case 'locked':
      return Colors.grey;
    case 'testing':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}

// Removed hardcoded menuData list