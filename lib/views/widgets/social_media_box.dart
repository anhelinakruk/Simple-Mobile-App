import 'package:dsw53518/utils/my_colors.dart';
import 'package:flutter/material.dart';

class SocialMediaBox extends StatelessWidget {
  const SocialMediaBox({required this.imagePath, super.key});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    const buttonSize = 50.0;
    const iconSize = 30.0;

    return ElevatedButton(
      onPressed: () {
        debugPrint('Google');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.whiteColor,
        minimumSize: const Size(buttonSize, buttonSize),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Image.asset(
        imagePath,
        width: iconSize,
        height: iconSize,
      ),
    );
  }
}
