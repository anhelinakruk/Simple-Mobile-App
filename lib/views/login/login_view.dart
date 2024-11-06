import 'package:dsw53518/utils/my_colors.dart';
import 'package:dsw53518/utils/my_images.dart';
import 'package:dsw53518/views/widgets/basic_form_field.dart';
import 'package:dsw53518/views/widgets/main_button.dart';
import 'package:dsw53518/views/widgets/main_title.dart';
import 'package:dsw53518/views/widgets/sign_prompt.dart';
import 'package:dsw53518/views/widgets/social_media_box.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const double _verticalPadding = 25;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Center(
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
              const BasicFormField(
                labelText: 'Email or User Name',
                iconPath: MyImages.person,
              ),
              const SizedBox(height: LoginView._verticalPadding),
              const BasicFormField(
                labelText: 'Password',
                iconPath: MyImages.locker,
                obscureText: true,
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
                  onPressed: () {},
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
              const SignPrompt(
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
