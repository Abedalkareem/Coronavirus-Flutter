import 'package:coronavirus/helpers/constants/app_images.dart';
import 'package:coronavirus/helpers/constants/strings.dart';
import 'package:coronavirus/helpers/theme.dart';
import 'package:coronavirus/models/country.dart';
import 'package:flutter/material.dart';

class CountryListItem extends StatelessWidget {
  final Country country;

  CountryListItem(this.country);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        AppImages.counterIcon,
        color: AppColors.white,
      ),
      title: Text(country.name),
      subtitle: Text("${Strings.counterTitle} ${country.numbers}"),
    );
  }
}
