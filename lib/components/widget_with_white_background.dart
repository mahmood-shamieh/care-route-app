import 'package:care_route/components/app_bar_widget.dart';
import 'package:flutter/material.dart';

class WidgetWithWhiteBackground extends StatelessWidget {
  final Widget? widget;
  final bool? showAppBar;
  final bool? showBackButton;

  const WidgetWithWhiteBackground(
      {super.key, this.widget, this.showAppBar, this.showBackButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ?? false
          ? AppBarWidget(
              showBackButton: showBackButton,
            )
          : null,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/whiteBackGround.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          widget ?? Container()
        ],
      ),
    );
  }
}
