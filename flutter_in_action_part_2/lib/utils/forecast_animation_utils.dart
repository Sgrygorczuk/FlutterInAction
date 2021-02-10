import 'package:flutter/material.dart';
import 'package:flutter_in_action_part_2/model/forecast_animation_state.dart';
import 'package:flutter_in_action_part_2/model/weather.dart';

class AnimationUtil {
  //=========================== Variables ======================================
  /// The hourly data is based on 3 hour intervals from 0..24
  static List<int> hours = [3, 6, 9, 12, 15, 18, 21, 24];

  //Holds the four icons to be drawn from
  static Map<WeatherDescription, IconData> weatherIcons = {
    WeatherDescription.sunny: Icons.wb_sunny,
    WeatherDescription.cloudy: Icons.wb_cloudy,
    WeatherDescription.clear: Icons.brightness_2,
    WeatherDescription.rain: Icons.beach_access,
  };

  //Translates temperature to string unit
  static Map<TemperatureUnit, String> temperatureLabels = {
    TemperatureUnit.celsius: "°C",
    TemperatureUnit.fahrenheit: "°F",
  };
  //============================================================================

  //=========================== Methods ========================================

  //Updates the state in which the background should be drawn
  static ForecastAnimationState getDataForNextAnimationState({ForecastDay selectedDay,
    int currentlySelectedTimeOfDay,}) {
    //Gets a new Forecast day based on selected day and time of day
    final newSelection = ForecastDay.getWeatherForHour(selectedDay,
      currentlySelectedTimeOfDay,);

    //Figures out what the screen should look like based on the given time and day
    final endAnimationState = ForecastAnimationState.stateForNextSelection(
      newSelection.dateTime.hour, newSelection.description,);

    return endAnimationState;
  }

  //Gets what hour it is
  static int getSelectedHourFromTabIndex(int index, ForecastDay selectedDay) {
    return selectedDay.hourlyWeather[index].dateTime.hour;
  }
//============================================================================
}