import 'package:flutter/material.dart';

class TransactionController {
  bool validateAmount(String amount, double balance) {
    if (amount.isEmpty) return false;
    final double? value = double.tryParse(amount);
    return value != null && value > 0 && value <= balance;
  }

  void sendMoney(String amount, double balance, VoidCallback onSuccess, VoidCallback onError) {
    if (validateAmount(amount, balance)) {
      onSuccess();
    } else {
      onError();
    }
  }
}
