import 'package:flutter/material.dart';

class NotificationComponent extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  const NotificationComponent({
    Key? key,
    required this.title,
    required this.message,
    this.icon = Icons.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue, size: 30),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
