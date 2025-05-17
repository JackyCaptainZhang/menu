import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import 'home_screen.dart';
import 'recipe_tips_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isZh = languageProvider.currentLanguage == 'zh';

    return Scaffold(
      appBar: AppBar(
        title: Text(isZh ? '乐乐&袁宝の美味Menu 😋' : 'Jacky & Yuan\'s Menu 😋'),
        actions: [
          Consumer<AppAuthProvider>(
            builder: (context, auth, _) {
              if (auth.user == null) {
                return TextButton.icon(
                  onPressed: () => auth.signInWithGoogle(),
                  icon: const Icon(Icons.login, color: Colors.pink),
                  label: Text(isZh ? '登录' : 'Sign In', style: const TextStyle(color: Colors.pink)),
                  style: TextButton.styleFrom(foregroundColor: Colors.pink),
                );
              } else {
                return Row(
                  children: [
                    if (auth.user!.photoURL != null)
                      CircleAvatar(
                        backgroundImage: NetworkImage(auth.user!.photoURL!),
                        radius: 16,
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        auth.user!.displayName ?? auth.user!.email ?? '',
                        style: const TextStyle(color: Colors.pink),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => auth.signOut(),
                      icon: const Icon(Icons.logout, color: Colors.pink),
                      label: Text(isZh ? '登出' : 'Sign Out', style: const TextStyle(color: Colors.pink)),
                      style: TextButton.styleFrom(foregroundColor: Colors.pink),
                    ),
                  ],
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              languageProvider.toggleLanguage();
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: IndexedStack(
            index: _selectedIndex,
            children: const [
              HomeScreen(),
              RecipeTipsScreen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.menu_book),
            label: isZh ? '菜单' : 'Menu',
          ),
          NavigationDestination(
            icon: const Icon(Icons.receipt_long),
            label: isZh ? '食谱秘籍' : 'Recipe Tips',
          ),
        ],
      ),
    );
  }
} 