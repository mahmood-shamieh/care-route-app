import 'package:care_route/components/custom_page_route.dart';
import 'package:care_route/views/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      animationController.dispose();
      Navigator.pushReplacement(
        context,
        CustomPageRoute(child: SignInScreen()),
      );
    });

    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween(begin: 1.0, end: 0.5).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/images/greenBackGround.png',
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            left: -190,
            bottom: -10,
            child: Transform.scale(
              scale: 0.8,
              child: Image.asset(
                'assets/images/greenLogo.png',
              ),
            ),
          ),
          Opacity(
            opacity: animationController.value,
            // opacity: 0.5,
            child: Image.asset(
              'assets/images/whiteLogo.png',
            ),
          )
        ],
      ),
    );
  }
}
