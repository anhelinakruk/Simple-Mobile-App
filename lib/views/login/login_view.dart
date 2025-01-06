import 'package:dsw53518/utils/my_colors.dart';
import 'package:dsw53518/utils/my_images.dart';
import 'package:dsw53518/views/home/home_view.dart';
import 'package:dsw53518/views/register/register_view.dart';
import 'package:dsw53518/widgets/basic_form_field.dart';
import 'package:dsw53518/widgets/main_button.dart';
import 'package:dsw53518/widgets/main_title.dart';
import 'package:dsw53518/widgets/sign_prompt.dart';
import 'package:dsw53518/widgets/social_media_box.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const double _verticalPadding = 25;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString('email') ?? '';
    final savedPassword = prefs.getString('password') ?? '';

    if (email == savedEmail && password == savedPassword) {
      await prefs.setBool('isLoggedIn', true);

      await Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (context) => const HomeView()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 40),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(MyImages.logo),
              const Align(
                alignment: Alignment.centerLeft,
                child: MainTitle(title: 'Sign in'),
              ),
              const SizedBox(height: LoginView._verticalPadding),
              BasicFormField(
                labelText: 'Email or User Name',
                iconPath: MyImages.person,
                controller: _emailController,
              ),
              const SizedBox(height: LoginView._verticalPadding),
              BasicFormField(
                labelText: 'Password',
                iconPath: MyImages.locker,
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: LoginView._verticalPadding),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => debugPrint('Forgot Password clicked'),
                  child: Text(
                    'Forget Password ?',
                    style: TextStyle(
                      color: MyColors.darkPurpleColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: LoginView._verticalPadding),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: MainButton(
                  onPressed: _login,
                  buttonText: 'Sign In',
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Or Sign in with',
                style: TextStyle(
                  color: MyColors.darkPurpleColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: LoginView._verticalPadding),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 24),
                  SocialMediaBox(imagePath: MyImages.google),
                  SizedBox(width: 24),
                  SocialMediaBox(imagePath: MyImages.facebook),
                  SizedBox(width: 24),
                  SocialMediaBox(imagePath: MyImages.x),
                  SizedBox(width: 24),
                  SocialMediaBox(imagePath: MyImages.linkedin),
                ],
              ),
              const SizedBox(height: 60),
              SignPrompt(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder<LoginView>(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const RegisterView(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1, 0);
                        const end = Offset.zero;
                        const curve = Curves.ease;
                        final tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        final offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                promptText: "Don't have an account?",
                buttonText: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
