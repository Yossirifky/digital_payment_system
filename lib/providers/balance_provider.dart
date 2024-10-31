import 'package:flutter/material.dart';

class BalanceProvider with ChangeNotifier {
  double _balance = 2486.12;

  double get balance => _balance;

  void deposit(double amount) {
    _balance += amount;
    notifyListeners();
  }

  void withdraw(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      notifyListeners();
    }
  }
}
