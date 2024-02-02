import 'package:care_route/shared/theme.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool? showBackButton;
  AppBarWidget({super.key, this.showBackButton})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;
  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyTheme.appBarColor,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 36,
            height: 37,
            child: !(widget.showBackButton ?? false)
                ? null
                : IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: MyTheme.mainColor,
                    ),
                  ),
          ),
          Image.asset(
            'assets/images/careRoute.png',
            width: 200,
            height: 25,
          ),
          Image.asset(
            'assets/images/smallLogo.png',
            width: 34,
            height: 37,
          ),
        ],
      ),
    );
  }
}
