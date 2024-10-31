import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  final List<Map<String, String>> _notifications = [
    {'title': 'Donate for Ukraine', 'message': 'Each coin is a step towards victory!'},
    {'title': 'Dribbble', 'message': '12 February 2023 - \$15.00'},
    {'title': 'Mailchimp', 'message': '12 February 2023 - \$350.00'},
  ];

  List<Map<String, String>> get notifications => _notifications;

  void addNotification(String title, String message) {
    _notifications.add({'title': title, 'message': message});
    notifyListeners();
  }
}
