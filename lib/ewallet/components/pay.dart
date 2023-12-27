import 'package:barcode_scan2/model/scan_result.dart';
import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';

class WalletPay extends StatefulWidget {
  const WalletPay({super.key});

  @override
  State<WalletPay> createState() => _WalletPayState();
}

class _WalletPayState extends State<WalletPay> {
  bool isEnlarged = false;
  bool isEnlarged2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pay"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isEnlarged = !isEnlarged;
                      });
                    },
                    child: Hero(
                      tag: "barcode",
                      child: Container(
                        width: isEnlarged ? 500 : 300,
                        child: Image(
                          image: AssetImage("assets/images/walletpay/barcode.png"),
                        ),
                      ),
                    ),
                  ),
                  Text("Tap the barcode to enlarge it"),
                  SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isEnlarged2 = !isEnlarged2;
                      });
                    },
                    child: Hero(
                      tag: "qrcode",
                      child: SizedBox(
                        width: 150,
                        child: Image(
                          width: isEnlarged2 ? 800 : 300,
                          image: AssetImage("assets/images/walletpay/qrcode.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0))),
                onPressed: () => _scanQRCode(context),

                child: Text(
                  "Scan QR Code",
                  style: TextStyle(
                    //color: Colors.white
                  ),
                ),
              ),
            ),
          ),
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

