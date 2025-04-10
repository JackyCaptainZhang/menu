import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  List<Category> _menuData = [];
  bool _isLoading = true;
  String? _error;

  List<Category> get menuData => _menuData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  MenuProvider() {
    loadMenuData();
  }

  Future<void> loadMenuData() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Load the JSON file from assets
      print('尝试加载 JSON 文件...');
      final jsonString = await rootBundle.loadString('lib/models/menu_data.json');
      print('JSON 文件加载成功，长度: ${jsonString.length}');
      
      final jsonData = json.decode(jsonString);
      print('JSON 解析成功');
      
      if (!jsonData.containsKey('categories')) {
        throw Exception('JSON 文件缺少 "categories" 字段');
      }
      
      final List<dynamic> categoriesJson = jsonData['categories'];
      print('找到 ${categoriesJson.length} 个分类');
      
      _menuData = categoriesJson.map<Category>((categoryJson) {
        // 确保每个分类都有ID
        String categoryId = categoryJson['id'] ?? generateRandomId('category');
        print('处理分类: $categoryId');
        
        if (!categoryJson.containsKey('subcategories')) {
          throw Exception('分类 $categoryId 缺少 "subcategories" 字段');
        }
        
        final List<dynamic> subcategoriesJson = categoryJson['subcategories'];
        
        return Category(
          id: categoryId,
          name: Map<String, String>.from(categoryJson['name']),
          subcategories: subcategoriesJson.map<Subcategory>((subcategoryJson) {
            // 确保每个子分类都有ID
            String subcategoryId = subcategoryJson['id'] ?? generateRandomId('subcategory');
            
            if (!subcategoryJson.containsKey('dishes')) {
              throw Exception('子分类 $subcategoryId 缺少 "dishes" 字段');
            }
            
            final List<dynamic> dishesJson = subcategoryJson['dishes'];
            
            return Subcategory(
              id: subcategoryId,
              name: Map<String, String>.from(subcategoryJson['name']),
              dishes: dishesJson.map<Dish>((dishJson) {
                return Dish(
                  id: dishJson['id'],
                  name: Map<String, String>.from(dishJson['name']),
                  status: dishJson['status'],
                  emoji: dishJson['emoji'],
                  notes: dishJson['notes'] != null 
                      ? Map<String, String>.from(dishJson['notes']) 
                      : null,
                  rating: dishJson['rating'],
                );
              }).toList(),
            );
          }).toList(),
        );
      }).toList();

      print('菜单数据加载完成，共 ${_menuData.length} 个分类');
      _isLoading = false;
      _error = null;
    } catch (e, stackTrace) {
      print('加载菜单数据出错: $e');
      print('堆栈跟踪: $stackTrace');
      _error = e.toString();
      _isLoading = false;
      
      // 出错时初始化一个空列表，避免 null 错误
      _menuData = [];
    }
    notifyListeners();
  }

  // Helper method to generate random IDs if they don't exist in the JSON
  String generateRandomId(String prefix) {
    return '$prefix-${DateTime.now().millisecondsSinceEpoch}';
  }
} 