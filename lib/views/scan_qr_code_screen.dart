import 'dart:io';

import 'package:care_route/components/my_button.dart';
import 'package:care_route/controller/scan_qr_code_screen_controller.dart';
import 'package:care_route/shared/theme.dart';
import 'package:care_route/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

late ScanQRCodeScreenController scanQRCodeScreenController;

class ScanQRCodeScreen extends StatefulWidget {
  const ScanQRCodeScreen({super.key});

  @override
  State<ScanQRCodeScreen> createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  @override
  void initState() {
    scanQRCodeScreenController = ScanQRCodeScreenController(context: context);
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  // }

  @override
  void dispose() {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>controller disposed');
    scanQRCodeScreenController.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Center(
            child: QRView(
              key: scanQRCodeScreenController.qrKey,
              onQRViewCreated: (controller) => scanQRCodeScreenController
                  .scanQrCode(controller: controller, context: context),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: MyButton(
                  text: 'Back',
                  action: () => scanQRCodeScreenController.moveToBack(),
                  buttonColor: MyTheme.greyColor,
                  fontWeight: FontWeight.bold,
                  textColor: MyTheme.mainColor,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
