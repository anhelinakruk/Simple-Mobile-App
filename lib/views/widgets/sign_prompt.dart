import 'package:dsw53518/utils/my_colors.dart';
import 'package:dsw53518/views/register/register_view.dart';
import 'package:flutter/material.dart';

class SignPrompt extends StatelessWidget {
  final String promptText;
  final String buttonText;

  const SignPrompt({
    required this.promptText,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          promptText,
          style: TextStyle(
            color: MyColors.darkPurpleColor,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const RegisterView(),
              ),
            );
          },
          child: Text(
            buttonText,
            style: TextStyle(
              color: MyColors.darkPurpleColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
