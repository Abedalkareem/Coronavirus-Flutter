import 'package:coronavirus/helpers/constants/app_images.dart';
import 'package:coronavirus/helpers/constants/strings.dart';
import 'package:coronavirus/helpers/theme.dart';
import 'package:flutter/material.dart';

class PreventionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PreventionScreen();
  }
}

class _PreventionScreen extends State<StatefulWidget> {
  final preventionList = Strings.preventionList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  AppImages.preventionIcon,
                  color: AppColors.white,
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                  ),
                ),
                Text(
                  Strings.preventionTitle,
                  style: Styles.title20,
                )
              ],
            ),
            ListView.builder(
                itemCount: preventionList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(preventionList[index], style: Styles.body16),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
