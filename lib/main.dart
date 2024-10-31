import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:digital_payment_system/providers/balance_provider.dart';
import 'package:digital_payment_system/providers/notification_provider.dart';
import 'package:digital_payment_system/core/config/main_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BalanceProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: MyApp(),
    ),
  );
}