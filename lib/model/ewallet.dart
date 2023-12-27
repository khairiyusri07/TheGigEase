import 'package:flutter_application_1/model/user_model.dart';

class eWallet {
  final User userId;
  final double balance;

  eWallet({
    required this.userId,
    required this.balance,
  });
}

List<eWallet> Ewallet = [
  eWallet(
    userId: currentUser1,
    balance: 132.00,

  )
];