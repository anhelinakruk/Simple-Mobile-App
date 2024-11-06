import 'package:dsw53518/utils/my_images.dart';
import 'package:dsw53518/views/widgets/main_title.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(MyImages.circles),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                  ),
                  child: Row(
                    children: [
                      Image.asset(MyImages.arrowBack),
                      const Text('Back'),
                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 40),
                width: double.infinity,
                child: const Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MainTitle(title: 'Sign up'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
