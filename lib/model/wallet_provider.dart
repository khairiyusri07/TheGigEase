// wallet_provider.dart

import 'package:flutter/material.dart';

class Transaction {
  final String type;
  final double amount;
  final DateTime date;

  Transaction({required this.type, required this.amount, required this.date});
}

class WalletProvider extends ChangeNotifier {
  double _balance = 100.0;
  List<Transaction> _transactions = [];

  double get balance => _balance;
  List<Transaction> get transactions => _transactions;

  void addMoney(double amount) {
    _balance += amount;
    _transactions.add(Transaction(type: 'Top up', amount: amount, date: DateTime.now()));
    notifyListeners();
  }

  void Transfer(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      _transactions.add(Transaction(type: 'Transfer', amount: amount, date: DateTime.now()));
      notifyListeners();
    } else {
      // Handle insufficient balance
    }
  }

  void Withdrawal(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      _transactions.add(Transaction(type: 'Withdrawal', amount: amount, date: DateTime.now()));
      notifyListeners();
    } else {
      // Handle insufficient balance
    }
  }

  List<Transaction> filterTransactions(String filterType) {
    if (filterType == 'All') {
      return _transactions;
    } else {
      return _transactions.where((transaction) => transaction.type == filterType).toList();
    }
  }
}

