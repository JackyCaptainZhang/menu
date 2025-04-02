import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _currentLanguage = 'zh'; // 默认中文

  String get currentLanguage => _currentLanguage;

  void toggleLanguage() {
    _currentLanguage = _currentLanguage == 'zh' ? 'en' : 'zh';
    notifyListeners();
  }
} 