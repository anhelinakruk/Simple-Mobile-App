import 'package:dsw53518/utils/my_images.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';
import '../register/register_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const double _verticalPadding = 26.0;
  static const double _inputBorderRadius = 15.0;
  static const EdgeInsets _iconPadding = EdgeInsets.only(
    left: 11,
    top: 14,
    bottom: 14,
    right: 24,
  );

  Widget _buildTextField({
    required String labelText,
    required String iconPath,
    bool obscureText = false,
  }) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_inputBorderRadius),
          borderSide: BorderSide(
            color: MyColors.purpleColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_inputBorderRadius),
          borderSide: BorderSide(
            color: MyColors.purpleColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_inputBorderRadius),
          borderSide: BorderSide(
            color: MyColors.purpleColor,
            width: 2.0,
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: MyColors.transparentBlack),
        prefixIcon: Padding(
          padding: _iconPadding,
          child: Image.asset(iconPath),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 40),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(MyImages.logo),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: MyColors.darkPurpleColor,
                  ),
                ),
              ),
              const SizedBox(height: _verticalPadding),
              _buildTextField(
                labelText: 'Email or User Name',
                iconPath: MyImages.person,
              ),
              const SizedBox(height: _verticalPadding),
              _buildTextField(
                labelText: 'Password',
                iconPath: MyImages.locker,
                obscureText: true,
              ),
              const SizedBox(height: _verticalPadding),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => print('Forgot Password clicked'),
                  child: Text(
                    'Forget Password ?',
                    style: TextStyle(
                      color: MyColors.darkPurpleColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: _verticalPadding),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: MyColors.lightPurpleColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_inputBorderRadius),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign In', // Corrected the typo
                    style: TextStyle(
                      color: MyColors.whiteColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: _verticalPadding),
            ],
          ),
        ),
      ),
    );
  }
}
