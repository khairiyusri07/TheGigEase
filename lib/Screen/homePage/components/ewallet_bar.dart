import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../ewallet/components/ScanQRCode.dart';
import '../../../ewallet/components/pay.dart';
import '../../../ewallet/read_firestore_data/wallet_firestore_balance.dart';
import '../../../ewallet/top_up_screen.dart';
import '../../../ewallet/transfer_screen.dart';
import '../../../ewallet/wallet__main_screen.dart';
import '../../../model/wallet_provider.dart';

class EWalletOptions extends StatelessWidget {
  const EWalletOptions({Key? key});

  @override
  Widget build(BuildContext context) {
    final walletProvider = Provider.of<WalletProvider>(context);
    final user = FirebaseAuth.instance.currentUser!;
    List<String> docIDs = [];


// get docIDs
    Future getDocId() async {
      await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference);
          docIDs.add(document.reference.id);
        }),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
      child: Container(
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade100,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0,2)
          ),]
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EWalletOption(icon: Icons.qr_code, label: "Scan",
                onTap: () => _scanQRCode(context),
              ),
              Container(height: double.infinity, width: 1,color: Colors.grey.shade300,),
              FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  // Check if the Future is complete
                  if (snapshot.connectionState == ConnectionState.done) {
                    // Use the first docID if available
                    String documentId = docIDs.isNotEmpty ? docIDs[0] : '';
                    // Display the user's email using GetUserName
                    return EWalletOption(
                        icon: Icons.account_balance_wallet,
                        label: 'RM${walletProvider.balance.toStringAsFixed(2)}',

                        onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WalletScreen()),
                      );
                    },
                  );
                  } else {
                    // If the Future is not complete, show a loading indicator
                    return CircularProgressIndicator();
                  }
                },
              ),
              Container(height: double.infinity, width: 1,color: Colors.grey.shade300),
              EWalletOption(
                icon: Icons.payment,
                label: "Pay",
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WalletPay()),
                );
              },
              ),
              Container(height: double.infinity, width: 1,color: Colors.grey.shade300),
              EWalletOption(
                icon: Icons.swap_horiz,
                label: "Transfer",
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TransferScreen()),
                );
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EWalletOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const EWalletOption({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 5),
          Container(
            height: 30.0,
            width: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                SizedBox(width: 9),
                Icon(icon, size: 25.0, color: Colors.grey.shade600,),
              ],
            ),
          ),
          const SizedBox(height: 5.0),
          Text(label, style: const TextStyle(fontSize: 12.0)),
        ],
      ),
    );
  }
}Future<void> _scanQRCode(BuildContext context) async {
  try {
    ScanResult result = await BarcodeScanner.scan();
    // Handle the result, for example, you might want to use it to make a transaction.
    print('Scanned QR Code: ${result.rawContent}');
  } catch (e) {
    print('Error scanning QR Code: $e');
    // Handle the error, for example, show a snackbar.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error scanning QR Code: $e'),
      ),
    );
  }
}

