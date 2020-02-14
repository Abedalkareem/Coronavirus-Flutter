import 'package:coronavirus/helpers/constants/app_images.dart';
import 'package:coronavirus/helpers/constants/strings.dart';
import 'package:coronavirus/helpers/theme.dart';
import 'package:coronavirus/screens/main/counter_screen.dart';
import 'package:coronavirus/screens/main/map_screen.dart';
import 'package:coronavirus/screens/main/more/countries_screen.dart';
import 'package:coronavirus/screens/main/prevention_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              Strings.mainScreenTitle,
              style: Styles.title20.apply(color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: TabBar(
              indicatorColor: AppColors.white,
              tabs: [
                Tab(
                  icon: Image.asset(
                    AppImages.counterIcon,
                    width: 30,
                    height: 30,
                    color: AppColors.white.withAlpha(100),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    AppImages.mapIcon,
                    width: 30,
                    height: 30,
                    color: AppColors.white.withAlpha(100),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    AppImages.listIcon,
                    width: 30,
                    height: 30,
                    color: AppColors.white.withAlpha(100),
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    AppImages.maskIcon,
                    width: 30,
                    height: 30,
                    color: AppColors.white.withAlpha(100),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              CounterScreen(),
              MapScreen(),
              CountriesScreen(),
              PreventionScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
