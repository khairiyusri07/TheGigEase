import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../model/wallet_provider.dart';
import 'components/ewalletappbar.dart';
import 'widgets/walletBalance.dart';
import 'widgets/walletOptions.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String _selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);

    return Scaffold(
      appBar: const WalletAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           WalletBalance(),
           WalletOption(),

          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8,
                  ),
                  child: Text("eWallet Promotion",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 120,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "image promotion",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Transaction History:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height:0),
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
      ),
    );



  }



}
