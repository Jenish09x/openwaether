import 'package:flutter/material.dart';
import 'package:openwaether/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
          () => Navigator.pushReplacementNamed(context, 'home'),
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor.withOpacity(0.5),
        body: Center(
          child: Image.asset(
            'assets/image/Weather.png',
            height: size.height * 0.40,
          ),
        ),
      ),
    );
  }
}
