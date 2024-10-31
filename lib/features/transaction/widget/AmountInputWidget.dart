import 'package:flutter/material.dart';

class AmountInputWidget extends StatelessWidget {
  final TextEditingController controller;

  const AmountInputWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Amount',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.none, // Disable keyboard
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '\$ 00.00',
              hintStyle: TextStyle(color: Colors.white54, fontSize: 48),
            ),
          ),
        ),
      ],
    );
  }
}
