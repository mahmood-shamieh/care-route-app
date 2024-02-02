import 'package:care_route/views/orders_log.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQRCodeScreenController {
  ScanQRCodeScreenController({required this.context});
  late BuildContext context;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  void scanQrCode(
      {required QRViewController controller, required BuildContext context}) {
    this.controller = controller;
    this.controller!.scannedDataStream.listen((scanData) {
      result = scanData;

      if (result != null) {
        this.controller!.dispose();
        controller.dispose();
        this.controller!.pauseCamera();
        moveToBack();
        moveToOrderLog();
      }
    });
  }

  moveToOrderLog() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderLogScreen(),
      ),
    );
  }

  moveToBack() {
    Navigator.pop(context);
  }
}
