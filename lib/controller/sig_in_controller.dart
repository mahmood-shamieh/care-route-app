import 'package:care_route/components/custom_page_route.dart';
import 'package:care_route/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInController {
  final keepMeInProvider = StateProvider.autoDispose((ref) => false);
  void moveToHomePage({required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      CustomPageRoute(
        child: HomeScreen(),
      ),
    );
  }
}
