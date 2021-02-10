import 'package:flutter/material.dart';
import 'package:flutter_in_action_part_2/model/app_setting.dart';
import 'package:flutter_in_action_part_2/model/city.dart';
import 'package:flutter_in_action_part_2/page/settings_page.dart';
import 'package:flutter_in_action_part_2/utils/forecast_animation_utils.dart';

import '../styles.dart';
import 'forecast_page.dart';

//Public Widget
class PageContainer extends StatefulWidget {
  //======================== Variables =========================================
  final AppSetting settings;
  //============================================================================

  //========================== Constructor =====================================
    //Saves the settings
  const PageContainer({Key key, this.settings}) : super(key: key);
  //============================================================================

  //=============================== Methods ====================================
    //Creates the logic for this widget
  @override
  _PageContainerState createState() => _PageContainerState(settings);
  //============================================================================
}

//Privet Logic to that Widget
class _PageContainerState extends State<PageContainer> {
  //========================== Variables =======================================
  AppSetting settings;
  //============================================================================

  //============================ Constructor ===================================
  _PageContainerState(this.settings);
  //============================================================================

  //============================== Methods =====================================


  //Sends us to the settings page
  void _showSettingsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage(
          settings: settings,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ForecastPage(
      //Select menu button
      menu: PopupMenuButton(
        elevation: 0.0,
        icon: Icon(
          Icons.location_city,
          color: AppColor.textColorDark,
        ),
        onSelected: (selection) {
          setState(() {
            settings.activeCity = allAddedCities.firstWhere((city) => city.name == selection);
          });
        },
        //Pop up Menu with all the currently selected cities
        itemBuilder: (BuildContext context) {
          return allAddedCities
              .where((city) => city.active)
              .map((City city) => PopupMenuItem(
                  value: city.name,
                  child: Text(city.name),
          ))
              .toList();
        },
      ),
      settingsButton: FlatButton(
          child: Text(
            AnimationUtil.temperatureLabels[settings.selectedTemperature],
            style: Theme.of(context).textTheme.headline,
          ),
          onPressed: _showSettingsPage),
      settings: settings,
    );

  }
}