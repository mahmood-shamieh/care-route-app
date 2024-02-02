import 'package:care_route/components/my_button.dart';
import 'package:care_route/components/text_widget.dart';
import 'package:care_route/components/widget_with_white_background.dart';
import 'package:care_route/controller/home_screen_controller.dart';
import 'package:care_route/shared/theme.dart';
import 'package:flutter/material.dart';

late HomeScreenController homeScreenController;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeScreenController = HomeScreenController(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetWithWhiteBackground(
      showAppBar: true,
      widget: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(
              action: () => homeScreenController.moveToScanQRCodeScreen(),
              padding: const EdgeInsets.symmetric(vertical: 10),
              text: 'Scan QR',
            ),
            TextWidget(
              text:
                  'Scan the QR code \nto easily check the location or track the medication.',
              color: MyTheme.textBlackColor,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
            MyButton(
              text: 'Order Log',
              action: () => homeScreenController.moveToOrderLogScreen(),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            TextWidget(
              text:
                  'Scan the QR code \nto easily check the location or track the medication.',
              color: MyTheme.textBlackColor,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
            MyButton(
              text: 'Profile',
              action: () => homeScreenController.moveToProfileScreen(),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ],
        ),
      ),
    );
  }
}
