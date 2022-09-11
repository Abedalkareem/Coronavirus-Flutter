import 'package:coronavirus/helpers/constants/app_helper.dart';
import 'package:coronavirus/helpers/constants/app_images.dart';
import 'package:coronavirus/helpers/theme.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingView();
  }
}

class _LoadingView extends State<StatefulWidget> with TickerProviderStateMixin {
  late var _animationController;
  final _animationTime = 3;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _animationTime),
      upperBound: AppHelper.radiansFrom(degree: 360),
    );
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Center(
        child: Image.asset(
          AppImages.appLogo,
          width: 50,
          height: 50,
          color: AppColors.white,
        ),
      ),
      builder: (context, widget) {
        return Transform.rotate(
          angle: _animationController.value,
          child: widget,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
