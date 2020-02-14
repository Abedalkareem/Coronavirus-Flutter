import 'package:coronavirus/helpers/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;

  AppButton({
    @required this.onPressed,
    @required this.text,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: backgroundColor,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: Styles.button.apply(color: textColor),
          ),
        ),
        shape: StadiumBorder(),
      ),
    );
  }
}
