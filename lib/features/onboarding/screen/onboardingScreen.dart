import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Navigasi ke '/card-screen' ketika layar diklik
          Navigator.pushNamed(context, '/card-screen');
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'), // Path gambar
              fit: BoxFit.cover, // Membuat gambar sesuai dengan layar
            ),
          ),
        ),
      ),
    );
  }
}
