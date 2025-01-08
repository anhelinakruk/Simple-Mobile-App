import 'package:dsw53518/views/home/home_view.dart';
import 'package:dsw53518/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({
    required this.isLoggedIn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes Ap',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const HomeView() : const LoginView(),
    );
  }
}
