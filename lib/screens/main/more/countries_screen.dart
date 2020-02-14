import 'package:coronavirus/helpers/theme.dart';
import 'package:coronavirus/models/country.dart';
import 'package:coronavirus/screens/main/more/country_list_item.dart';
import 'package:coronavirus/viewmodels/countries_view_model.dart';
import 'package:coronavirus/views/loading_view.dart';
import 'package:flutter/material.dart';

class CountriesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CountriesScreen();
  }
}

class _CountriesScreen extends State<StatefulWidget> {
  var _viewModel = CountriesViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: StreamBuilder(
        stream: _viewModel.countriesStream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return LoadingView();
          } else {
            final data = snapshot.data as List<Country>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CountryListItem(data[index]);
                });
          }
        },
      ),
    );
  }
}
