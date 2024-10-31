import 'package:flutter/material.dart';
import 'package:digital_payment_system/core/components/NotificationComponent.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          NotificationComponent(
            title: 'Donate for Ukraine',
            message: 'Each coin is a step towards victory!',
          ),
          NotificationComponent(
            title: 'Dribbble',
            message: '12 February 2023 - \$15.00',
          ),
          NotificationComponent(
            title: 'Mailchimp',
            message: '12 February 2023 - \$350.00',
          ),
          // Tambahkan notifikasi lainnya jika perlu
        ],
      ),
    );
  }
}
