import 'package:dsw53518/utils/my_colors.dart';
import 'package:dsw53518/utils/my_images.dart';
import 'package:dsw53518/views/login/login_view.dart';
import 'package:dsw53518/views/widgets/basic_form_field.dart';
import 'package:dsw53518/views/widgets/main_button.dart';
import 'package:dsw53518/views/widgets/main_title.dart';
import 'package:dsw53518/views/widgets/sign_prompt.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                  const BasicFormField(
                    labelText: 'Full Name',
                    iconPath: MyImages.person,
                  ),
                  const SizedBox(height: 40),
                  const BasicFormField(
                    labelText: 'Email',
                    iconPath: MyImages.mail,
                  ),
                  const SizedBox(height: 40),
                  const BasicFormField(
                    labelText: 'Password',
                    iconPath: MyImages.locker,
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  const BasicFormField(
                    labelText: 'Confirm Password',
                    iconPath: MyImages.locker,
                    obscureText: true,
                  ),
                  const SizedBox(height: 80),
                  Center(
                    child: MainButton(
                      buttonText: 'Sign Up',
                      onPressed: () {},
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
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
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
