import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import '../components/pay.dart';
import '../top_up_screen.dart';
import '../transfer_screen.dart';
import '../withdrawal_screen.dart';

class WalletOption extends StatelessWidget {
  const WalletOption({Key? key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 20,
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 50,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0,2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _walletOptionUpper(
                        context,
                        Icons.wallet,
                        'Top Up',
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TopUpScreen()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      _walletOptionUpper(
                        context,
                        Icons.document_scanner_outlined,
                        'Scan',
                            () => _scanQRCode(context),
                      ),
                      const SizedBox(width: 10),
                      _walletOptionUpper(
                        context,
                        Icons.money,
                        'Transfer',
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TransferScreen()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _walletOptionLower(
                        context,
                        Icons.qr_code,
                        'Pay',
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WalletPay()),
                        ),
                      ),
                      const SizedBox(width: 10),
                      _walletOptionLower(
                        context,
                        Icons.wallet_membership_sharp,
                        'Withdrawal',
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WidrawalScreen()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _walletOptionUpper(BuildContext context,IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white54
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Icon(icon, color: Theme.of(context).primaryColor,),
            Text(text, style: TextStyle(color: Theme.of(context).primaryColor)),
          ],
        ),
      ),
    );
  }

  GestureDetector _walletOptionLower(BuildContext context,IconData icon, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white54
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Icon(icon, color: Theme.of(context).primaryColor,),
            Text(text,style: TextStyle(color: Theme.of(context).primaryColor)),
          ],
        ),
      ),
    );
  }

  Future<void> _scanQRCode(BuildContext context) async {
    try {
      ScanResult result = await BarcodeScanner.scan();
      print('Scanned QR Code: ${result.rawContent}');
    } catch (e) {
      print('Error scanning QR Code: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error scanning QR Code: $e'),
        ),
      );
    }
  }
}
