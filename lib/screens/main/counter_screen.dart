import 'package:coronavirus/helpers/constants/strings.dart';
import 'package:coronavirus/helpers/theme.dart';
import 'package:coronavirus/models/information.dart';
import 'package:coronavirus/viewmodels/counter_view_model.dart';
import 'package:coronavirus/views/loading_view.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterScreen();
  }
}

class _CounterScreen extends State<StatefulWidget> {
  final _viewModel = CounterViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: StreamBuilder(
          stream: _viewModel.infoStream,
          builder: (context, snapshot) {
            if (snapshot.error != null) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (snapshot.data == null) {
              return LoadingView();
            }
            final info = snapshot.data as Information;
            return Center(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        Strings.counterTitle,
                        style: Styles.body24.apply(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${info.total}",
                        style: Styles.title40.apply(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                Strings.deathsTitle,
                                style: Styles.body16
                                    .apply(color: AppColors.primary),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${info.deaths}",
                                style: Styles.title20
                                    .apply(color: AppColors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                Strings.recoveredTitle,
                                style:
                                    Styles.body16.apply(color: AppColors.green),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${info.recovered}",
                                style: Styles.title20
                                    .apply(color: AppColors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        Strings.counterNote,
                        style: Styles.body10.apply(color: AppColors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
