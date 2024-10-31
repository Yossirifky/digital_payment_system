import 'package:flutter/material.dart';

class RouteUtils {
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  static void navigateAndRemoveUntil(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
