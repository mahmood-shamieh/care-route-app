import 'package:care_route/components/widget_with_white_background.dart';
import 'package:flutter/material.dart';

class OrderLogScreen extends StatelessWidget {
  const OrderLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetWithWhiteBackground(
      showAppBar: true,
      showBackButton: true,
    );
  }
}
