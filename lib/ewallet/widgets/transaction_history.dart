import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/wallet_provider.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});


  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    String _selectedFilter = 'All';

    return Column(
      children: [
        Text(
          'Transaction History:',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: walletProvider.filterTransactions(_selectedFilter).length,
            itemBuilder: (context, index) {
              Transaction transaction = walletProvider.filterTransactions(_selectedFilter)[index];
              return ListTile(
                title: Text('${transaction.type}: \RM${transaction.amount.toStringAsFixed(2)}'),
                subtitle: Text('Date: ${transaction.date.toLocal()}'),
              );
            },
          ),
        ),

      ],
    );

  }
}
