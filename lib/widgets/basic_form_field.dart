import 'package:dsw53518/utils/my_colors.dart';
import 'package:flutter/material.dart';

class BasicFormField extends StatelessWidget {
  static const double _inputBorderRadius = 15;
  static const EdgeInsets _iconPadding = EdgeInsets.only(
    left: 11,
    top: 14,
    bottom: 14,
    right: 24,
  );

  const BasicFormField({
    required this.labelText,
    required this.iconPath,
    this.validator,
    this.obscureText = false,
    super.key,
    this.controller,
  });

  final String? Function(String?)? validator;
  final String labelText;
  final String iconPath;
  final bool obscureText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
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
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_inputBorderRadius),
          borderSide: BorderSide(
            color: MyColors.purpleColor,
            width: 2,
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: MyColors.transparentBlack),
        prefixIcon: Padding(
          padding: _iconPadding,
          child: Image.asset(iconPath),
        ),
      ),
    );
  }
}
