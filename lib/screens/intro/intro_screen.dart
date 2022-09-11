import 'package:coronavirus/helpers/constants/app_images.dart';
import 'package:coronavirus/helpers/constants/strings.dart';
import 'package:coronavirus/helpers/theme.dart';
import 'package:coronavirus/screens/main/main_screen.dart';
import 'package:coronavirus/views/app_button.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<StatefulWidget> with TickerProviderStateMixin {
  late var _animationController;
  final _animationTime = 8;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _animationController = AnimationController(
      lowerBound: -1,
      upperBound: 1,
      vsync: this,
      duration: Duration(seconds: _animationTime),
    );
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationController,
            child: Center(
              child: Transform.scale(
                scale: 3,
                child: Image.asset(AppImages.introMap),
              ),
            ),
            builder: (context, widget) {
              return Transform.translate(
                offset: Offset(_animationController.value * 200, 0),
                child: widget,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                onPressed: _showMainScreen,
                text: Strings.introScreenButton,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 240,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    AppImages.appLogo,
                    width: 150,
                    height: 150,
                    color: AppColors.secondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Text(
                      Strings.introScreenText,
                      style: Styles.title16.apply(color: AppColors.secondary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMainScreen() {
    _animationController.dispose();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainScreen()));
  }
}
