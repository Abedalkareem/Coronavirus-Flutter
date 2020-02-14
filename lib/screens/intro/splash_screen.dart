import 'dart:async';
import 'package:coronavirus/helpers/constants/app_helper.dart';
import 'package:coronavirus/helpers/constants/app_images.dart';
import 'package:coronavirus/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<StatefulWidget>
    with TickerProviderStateMixin {
  var _animationController;
  final _animationTime = 5;

  @override
  void initState() {
    super.initState();
    _startAnimation();
    _startTimer();
  }

  void _startAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _animationTime),
      upperBound: AppHelper.radiansFrom(degree: 360),
    );
    _animationController.repeat();
  }

  void _startTimer() {
    Timer(Duration(seconds: 4), () {
      _animationController.dispose();
      _showIntroScreen();
    });
  }

  void _showIntroScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => IntroScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: AnimatedBuilder(
        animation: _animationController,
        child: Center(
          child: Image.asset(
            AppImages.appLogo,
            width: 150,
            height: 150,
          ),
        ),
        builder: (context, widget) {
          return Transform.rotate(
            angle: _animationController.value,
            child: widget,
          );
        },
      ),
    );
  }
}
