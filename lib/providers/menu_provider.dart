import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'dart:async';
import '../models/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  List<Category> _menuData = [];
  bool _isLoading = true;
  String? _error;

  List<Category> get menuData => _menuData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  MenuProvider() {
    // 更短的延迟时间，防止卡在加载界面
    Future.delayed(const Duration(milliseconds: 200), () {
      loadMenuData();
    });
    
    // 添加超时处理
    _setupTimeout();
  }
  
  void _setupTimeout() {
    // 无论是否加载完成，最多4秒后自动标记为加载完成
    Future.delayed(const Duration(seconds: 4), () {
      if (_isLoading) {
        print('菜单数据加载超时，强制结束加载状态');
        _isLoading = false;
        if (_menuData.isEmpty) {
          _menuData = _createEmptyMenu(); // 创建空菜单数据以防止错误
        }
        notifyListeners();
      }
    });
  }

  // 检测是否为移动设备
  bool _isMobileDevice() {
    try {
      // 使用Platform检测移动设备 (iOS或Android)
      return Platform.isIOS || Platform.isAndroid;
    } catch (e) {
      // 如果Platform不可用（如Web平台），返回false
      return false;
    }
  }

  Future<void> loadMenuData() async {
    try {
      _isLoading = true;
      notifyListeners();

      // 加载JSON文件
      print('尝试加载JSON文件...');
      final jsonString = await rootBundle.loadString('lib/models/menu_data.json');
      print('JSON文件加载成功，长度: ${jsonString.length}');
      
      // 较短的延迟
      await Future.delayed(const Duration(milliseconds: 300));
      
      final jsonData = json.decode(jsonString);
      print('JSON解析成功');
      
      if (!jsonData.containsKey('categories')) {
        throw Exception('JSON文件缺少"categories"字段');
      }
      
      final List<dynamic> categoriesJson = jsonData['categories'];
      print('找到${categoriesJson.length}个分类');
      
      _menuData = categoriesJson.map<Category>((categoryJson) {
        // 解析每个分类
        String categoryId = categoryJson['id'] ?? generateRandomId('category');
        
        final List<dynamic> subcategoriesJson = categoryJson['subcategories'] ?? [];
        
        return Category(
          id: categoryId,
          name: Map<String, String>.from(categoryJson['name']),
          subcategories: subcategoriesJson.map<Subcategory>((subcategoryJson) {
            // 解析每个子分类
            String subcategoryId = subcategoryJson['id'] ?? generateRandomId('subcategory');
            
            final List<dynamic> dishesJson = subcategoryJson['dishes'] ?? [];
            
            return Subcategory(
              id: subcategoryId,
              name: Map<String, String>.from(subcategoryJson['name']),
              dishes: dishesJson.map<Dish>((dishJson) {
                // 解析每个菜品
                return Dish(
                  id: dishJson['id'] ?? generateRandomId('dish'),
                  name: Map<String, String>.from(dishJson['name']),
                  status: dishJson['status'] ?? 'locked',
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

      print('菜单数据加载完成，共${_menuData.length}个分类');
      _isLoading = false;
      _error = null;
    } catch (e, stackTrace) {
      print('加载菜单数据出错: $e');
      print('堆栈跟踪: $stackTrace');
      _error = e.toString();
      _isLoading = false;
      
      // 出错时初始化一个基本菜单，避免界面崩溃
      _menuData = _createEmptyMenu();
    }
    notifyListeners();
  }

  // 创建一个空的基本菜单数据，防止加载失败时崩溃
  List<Category> _createEmptyMenu() {
    return [
      Category(
        id: 'default',
        name: {'zh': '菜单', 'en': 'Menu'},
        subcategories: [
          Subcategory(
            id: 'default-sub',
            name: {'zh': '暂无数据', 'en': 'No Data'},
            dishes: [
              Dish(
                id: 'default-dish',
                name: {'zh': '加载失败', 'en': 'Loading Failed'},
                status: 'locked',
                emoji: '⚠️',
                notes: {'zh': '请稍后再试', 'en': 'Please try again later'},
                rating: null,
              ),
            ],
          ),
        ],
      ),
    ];
  }

  // Helper method to generate random IDs
  String generateRandomId(String prefix) {
    return '$prefix-${DateTime.now().millisecondsSinceEpoch}';
  }
} 