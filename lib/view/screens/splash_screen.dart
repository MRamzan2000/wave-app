import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weave_app/view/screens/on_boarding_screen.dart';
import 'package:weave_app/view/utils/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Get.offAll(() => OnBoardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Weave",
          style: AppTextStyles.specialLimelightHeading,
        ),
      ),
    );
  }
}
