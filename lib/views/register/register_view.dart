import 'package:dsw53518/utils/my_colors.dart';
import 'package:dsw53518/utils/my_images.dart';
import 'package:dsw53518/views/login/login_view.dart';
import 'package:dsw53518/widgets/basic_form_field.dart';
import 'package:dsw53518/widgets/main_button.dart';
import 'package:dsw53518/widgets/main_title.dart';
import 'package:dsw53518/widgets/sign_prompt.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _register() async {
    final fullName = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 3 characters'),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullName);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('isLogged', true);

    await Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(builder: (context) => const LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.whiteColor,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          MyImages.arrowBack,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 4),
                        const Text('Back'),
                      ],
                    ),
                  ),
                  Image.asset(
                    MyImages.circles,
                    width: 120,
                    height: 95,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const MainTitle(title: 'Sign Up'),
                  const SizedBox(height: 46),
                  BasicFormField(
                    labelText: 'Full Name',
                    iconPath: MyImages.person,
                    controller: _fullNameController,
                  ),
                  const SizedBox(height: 40),
                  BasicFormField(
                    labelText: 'Email',
                    iconPath: MyImages.mail,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 40),
                  BasicFormField(
                    labelText: 'Password',
                    iconPath: MyImages.locker,
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 40),
                  BasicFormField(
                    labelText: 'Confirm Password',
                    iconPath: MyImages.locker,
                    obscureText: true,
                    controller: _confirmPasswordController,
                  ),
                  const SizedBox(height: 80),
                  Center(
                    child: MainButton(
                      buttonText: 'Sign Up',
                      onPressed: _register,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SignPrompt(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder<LoginView>(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const LoginView(),
                            transitionsBuilder: (
                              context,
                              animation,
                              secondaryAnimation,
                              child,
                            ) {
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
                      promptText: 'Already have an account?',
                      buttonText: 'Sign In',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
