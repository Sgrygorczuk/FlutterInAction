import 'package:flutter_in_action_part_2/model/weather.dart';

import 'date_utils.dart';
import 'forecast_animation_utils.dart';

/// This class is used to turn enum values, date times, etc into human-readable Strings
class Humanize {
  static List<String> enumValues(List<dynamic> values) {
    return values.map((u) => u.toString().split(".")[1]).toList();
  }

  //Returns a value before the last .
  static String singleEnumValue(dynamic value) {return value.toString().split(".").last;}

  //Returns the current temperature, if in Fahrenheit converts it
  static String currentTemperature(TemperatureUnit unit, Weather temp) {
    var tempInt = temp.temperature.current;
    if (unit == TemperatureUnit.fahrenheit) {
      tempInt = Temperature.celsiusToFahrenheit(temp.temperature.current);
    }
    return '$tempInt ${AnimationUtil.temperatureLabels[unit]}';
  }

  //Returns the text of weather description
  static String weatherDescription(Weather weather) {
    var day = DateUtils.weekdays[weather.dateTime.weekday];
    var description = Weather.displayValues[weather.description];
    return "$day. ${description.replaceFirst(description[0], description[0].toUpperCase())}.";
  }

  //Returns time in hours
  static List<String> allHours() {
    return AnimationUtil.hours.map((hour) => '$hour:00').toList();
  }
}
