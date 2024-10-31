import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color color;
  final String cardNumber;
  final String expiryDate;
  final String balance;

  const CardWidget({
    Key? key,
    required this.color,
    required this.cardNumber,
    required this.expiryDate,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 32,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            balance,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            '**** $cardNumber',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Text(
            'EXP $expiryDate',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
