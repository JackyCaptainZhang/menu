import 'package:flutter/material.dart';
import '../models/menu_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuProvider extends ChangeNotifier {
  List<Category> _menuData = [];
  bool _isLoading = true;
  String? _error;

  List<Category> get menuData => _menuData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  MenuProvider() {
    FirebaseFirestore.instance.collection('dishes').snapshots().listen((snapshot) {
      final allDishes = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'id': doc.id,
          'name': data['name'],
          'status': data['status'],
          'emoji': data['emoji'],
          'notes': data['notes'],
          'rating': data['rating'],
          'categoryId': data['categoryId'],
          'categoryName': data['categoryName'],
          'subcategoryName': data['subcategoryName'],
        };
      }).toList();
      final Map<String, Map<String, dynamic>> categoryMap = {};
      for (var dish in allDishes) {
        final catId = dish['categoryId'] ?? '';
        final catName = Map<String, String>.from(dish['categoryName'] ?? {});
        final subName = Map<String, String>.from(dish['subcategoryName'] ?? {});
        final subId = subName['zh'] ?? subName['en'] ?? '';
        if (!categoryMap.containsKey(catId)) {
          categoryMap[catId] = {
            'id': catId,
            'name': catName,
            'subcategories': <String, Map<String, dynamic>>{},
          };
        }
        final subMap = categoryMap[catId]!['subcategories'] as Map<String, Map<String, dynamic>>;
        if (!subMap.containsKey(subId)) {
          subMap[subId] = {
            'id': subId,
            'name': subName,
            'dishes': <Map<String, dynamic>>[],
          };
        }
        subMap[subId]!['dishes'].add(dish);
      }
      _menuData = categoryMap.values.map((cat) {
        final subList = (cat['subcategories'] as Map<String, Map<String, dynamic>>).values.map((sub) {
          return Subcategory(
            id: sub['id'],
            name: Map<String, String>.from(sub['name']),
            dishes: (sub['dishes'] as List).map<Dish>((dish) {
              return Dish(
                id: dish['id'],
                name: Map<String, String>.from(dish['name'] ?? {}),
                status: dish['status'] ?? 'locked',
                emoji: dish['emoji'],
                notes: dish['notes'] != null ? Map<String, String>.from(dish['notes']) : null,
                rating: dish['rating'],
              );
            }).toList(),
          );
        }).toList();
        return Category(
          id: cat['id'],
          name: Map<String, String>.from(cat['name']),
          subcategories: subList,
        );
      }).toList();
      _isLoading = false;
      _error = null;
      notifyListeners();
    }, onError: (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    });
  }
} 