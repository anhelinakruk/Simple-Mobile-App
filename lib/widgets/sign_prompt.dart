import 'package:dsw53518/utils/my_colors.dart';
import 'package:flutter/material.dart';

class SignPrompt extends StatelessWidget {
  final String promptText;
  final String buttonText;
  final VoidCallback onPressed;

  const SignPrompt({
    required this.promptText,
    required this.buttonText,
    required this.onPressed,
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
          onPressed: onPressed,
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
