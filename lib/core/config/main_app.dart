import 'package:flutter/material.dart';
import 'package:digital_payment_system/features/card_management/screen/CardScreen.dart';
import 'package:digital_payment_system/features/transaction/screen/SendMoneyScreen.dart';
import 'package:digital_payment_system/features/onboarding/screen/onboardingScreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unipay App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/send-money': (context) => SendMoneyScreen(),
        '/card-screen': (context) => CardScreen(),
      },
    );
  }
}
