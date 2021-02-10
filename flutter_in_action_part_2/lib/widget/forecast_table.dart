import 'package:flutter/material.dart';
import 'package:flutter_in_action_part_2/model/app_setting.dart';
import 'package:flutter_in_action_part_2/model/weather.dart';
import 'package:flutter_in_action_part_2/utils/forecast_animation_utils.dart';

import 'color_transition_icon.dart';
import 'color_transition_text.dart';

class ForecastTableView extends StatelessWidget {
  //============================ Variables =====================================
  final AppSetting settings;
  final AnimationController controller;
  final Tween<Color> textColorTween;
  final Forecast forecast;

  static const Map<int, String> weekdays = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday",
  };
  //============================================================================

  //============================== Constructor =================================
  ForecastTableView({this.textColorTween, this.controller, this.forecast, this.settings});
  //============================================================================

  //=============================== Methods ====================================
  //Returns icon info
  IconData _getWeatherIcon(Weather weather) {
    return AnimationUtil.weatherIcons[weather.description];
  }

  //Returns the value of temp, if in Fahrenheit converts first
  int _temperature(int temp) {
    if (settings.selectedTemperature == TemperatureUnit.fahrenheit) {
      return Temperature.celsiusToFahrenheit(temp);
    }
    return temp;
  }
  //============================================================================

  //================================== Widget ==================================
  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText2;
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        bottom: 48.0,
      ),
      //Sets up the tables
      child: Table(
        //Gives the table set widths (Sets to be 3 columns)
        columnWidths: {
          0: FixedColumnWidth(100.0),
          2: FixedColumnWidth(20.0),
          3: FixedColumnWidth(20.0),
        },
        //Sets up where it should the data vertical, the in middle of the cell
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        //Sets up a list constructor that will wait for a call back that will
        //populate 7 entries, kind of like a loop
        children: List.generate(7, (int index) {
          //Reads the current day in forecast
          ForecastDay day = forecast.days[index];
          Weather dailyWeather = forecast.days[index].hourlyWeather[0];
          //Get the icon based on weather
          var weatherIcon = _getWeatherIcon(dailyWeather);
          return TableRow(
            children: [
              //Displays day of the week text
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  //Uses the Color Transition Text Widget
                  child: ColorTransitionText(
                    text: weekdays[dailyWeather.dateTime.weekday],
                    style: textStyle,
                    animation: textColorTween.animate(controller),
                  ),
                ),
              ),
              //Displays the icon
              TableCell(
                child: ColorTransitionIcon(
                  icon: weatherIcon,
                  animation: textColorTween.animate(controller),
                  size: 16.0,
                ),
              ),
              //Displays the temperature high
              TableCell(
                child: ColorTransitionText(
                  text: _temperature(day.max).toString(),
                  style: textStyle,
                  animation: textColorTween.animate(controller),
                ),
              ),
              //Displays the temperature low
              TableCell(
                child: ColorTransitionText(
                  text: _temperature(day.min).toString(),
                  style: textStyle,
                  animation: textColorTween.animate(controller),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
  //============================================================================
}