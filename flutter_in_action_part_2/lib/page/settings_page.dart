import 'package:flutter/material.dart';
import 'package:flutter_in_action_part_2/model/app_setting.dart';
import 'package:flutter_in_action_part_2/model/city.dart';
import 'package:flutter_in_action_part_2/model/weather.dart';
import 'package:flutter_in_action_part_2/utils/humanize.dart';
import 'package:flutter_in_action_part_2/widget/segment_control.dart';

import '../styles.dart';
import 'add_city_page.dart';

class SettingsPage extends StatefulWidget {
  final AppSetting settings;

  const SettingsPage({Key key, this.settings}) : super(key: key);

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  List<String> get temperatureOptions => Humanize.enumValues(TemperatureUnit.values);

  void _handleCityActiveChange(bool b, City city) {
    setState(() {
      city.active = b;
    });
  }

  void _handleTemperatureUnitChange(int selection) {
    setState(() {
      widget.settings.selectedTemperature = TemperatureUnit.values.toList()[selection];
    });
  }

  void _handleDismiss(DismissDirection dir, City removedCity) {
    if (dir == DismissDirection.endToStart) {
      allAddedCities.removeWhere((city) => city == removedCity);
      if (widget.settings.activeCity == removedCity) {
        widget.settings.activeCity = allAddedCities.firstWhere((city) => city.active);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings Page',
          style: TextStyle(color: AppColor.textColorLight),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Temperature Unit'),
            SegmentedControl(
              temperatureOptions,
              onSelectionChanged: (int selection) => _handleTemperatureUnitChange(selection),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Add new city"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (BuildContext context) {
                      return AddNewCityPage();
                    },
                  ),
                );
              },
            ),
            Divider(),
            Expanded(
              //List View
              child: ListView.builder(
                //ShrinkWrap tells the ListView to try ot be the size of it's chidlren
                shrinkWrap: true,
                //Must know how many to make
                itemCount: allAddedCities.length,
                //The set up for each entry in the list
                itemBuilder: (BuildContext context, int index) {
                  final city = allAddedCities[index];
                  //Gesture widget that allows you to swipe item off the screen
                  return Dismissible(
                    onDismissed: (DismissDirection dir) => _handleDismiss(dir, city),
                    confirmDismiss: (DismissDirection dir) async => dir == DismissDirection.endToStart,
                    background: Container(
                      child: Icon(Icons.delete_forever),
                      decoration: BoxDecoration(color: Colors.red[700]),
                    ),
                    key: ValueKey(city),
                    //Creates the checkboxes next to name
                    child: CheckboxListTile(
                      value: city.active,
                      title: Text(city.name),
                      onChanged: (bool b) => _handleCityActiveChange(b, city),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
