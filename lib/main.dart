import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/language_provider.dart';
import 'providers/menu_provider.dart';
import 'screens/main_container.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAcoX8YHHH5yXQd6_5f-LQKFRcPvGauE1M",
      authDomain: "menu-app-823bd.firebaseapp.com",
      projectId: "menu-app-823bd",
      storageBucket: "menu-app-823bd.appspot.com",
      messagingSenderId: "840849253944",
      appId: "1:840849253944:web:7df351b402c88a3a03a8cd",
    ),
  );
  runApp(const MyApp());
}

class AppAuthProvider extends ChangeNotifier {
  User? user;
  AppAuthProvider() {
    FirebaseAuth.instance.authStateChanges().listen((u) {
      user = u;
      notifyListeners();
    });
  }
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => AppAuthProvider()),
      ],
      child: MaterialApp(
        title: 'Menu App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            background: const Color(0xFFFFF0F0),
          ),
          useMaterial3: true,
        ),
        home: const FontPreloader(child: MainContainer()),
      ),
    );
  }
}

class FontPreloader extends StatefulWidget {
  final Widget child;
  const FontPreloader({super.key, required this.child});
  @override
  State<FontPreloader> createState() => _FontPreloaderState();
}

class _FontPreloaderState extends State<FontPreloader> {
  bool _fontsLoaded = false;
  @override
  void initState() {
    super.initState();
    _preloadFonts();
  }
  Future<void> _preloadFonts() async {
    try {
      final List<TextSpan> spans = [
        const TextSpan(
          text: '菜单 食谱秘籍 已解锁 测试中 待解锁 备注 关闭 加载中 乐乐&袁宝の美味Menu 分 湘菜 川菜 粤菜 鲁菜 徽菜 苏/浙 闽菜',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const TextSpan(
          text: 'Menu Recipe Tips Unlocked Testing Locked Notes Close Loading',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: String.fromCharCode(Icons.menu_book.codePoint),
          style: TextStyle(fontFamily: Icons.menu_book.fontFamily, package: Icons.menu_book.fontPackage, fontSize: 24),
        ),
        TextSpan(
          text: String.fromCharCode(Icons.receipt_long.codePoint),
          style: TextStyle(fontFamily: Icons.receipt_long.fontFamily, package: Icons.receipt_long.fontPackage, fontSize: 24),
        ),
        TextSpan(
          text: String.fromCharCode(Icons.expand_more.codePoint),
          style: TextStyle(fontFamily: Icons.expand_more.fontFamily, package: Icons.expand_more.fontPackage, fontSize: 24),
        ),
        TextSpan(
          text: String.fromCharCode(Icons.star.codePoint),
          style: TextStyle(fontFamily: Icons.star.fontFamily, package: Icons.star.fontPackage, fontSize: 24),
        ),
        TextSpan(
          text: String.fromCharCode(Icons.language.codePoint),
          style: TextStyle(fontFamily: Icons.language.fontFamily, package: Icons.language.fontPackage, fontSize: 24),
        ),
      ];
      for (final span in spans) {
        final textPainter = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
      }
      await Future.delayed(const Duration(milliseconds: 800));
    } catch (e) {
      print('预加载字体失败: $e');
    } finally {
      if (mounted) {
        setState(() {
          _fontsLoaded = true;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    if (!_fontsLoaded) {
      return MaterialApp(
        theme: Theme.of(context),
        home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(strokeWidth: 4.0),
                ),
                SizedBox(height: 16),
                Text(
                  '加载中...',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return widget.child;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
