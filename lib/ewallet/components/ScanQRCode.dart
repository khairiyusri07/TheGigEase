import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';

class QRCodeScanner {
  BuildContext context;

  QRCodeScanner(this.context);

  Future<void> scanQRCode() async {
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
}
