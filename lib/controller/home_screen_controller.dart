import 'package:care_route/components/custom_page_route.dart';
import 'package:care_route/views/orders_log.dart';
import 'package:care_route/views/profile_screen.dart';
import 'package:care_route/views/scan_qr_code_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenController {
  HomeScreenController({required this.context});
  late BuildContext context;
  void moveToScanQRCodeScreen() {
    Navigator.push(context, CustomPageRoute(child: ScanQRCodeScreen()));
    ;
  }

  moveToProfileScreen() {
    Navigator.push(context, CustomPageRoute(child: ProfileScreen()));
  }

  moveToOrderLogScreen() {
    Navigator.push(context, CustomPageRoute(child: OrderLogScreen()));
  }
}
