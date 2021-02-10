import 'dart:ui';

import 'package:flutter_in_action_part_2/model/weather.dart';
import '../styles.dart';

class ForecastAnimationState {
  //================================ Variables =================================
  final Color backgroundColor;              //Sets background color
  final Color sunColor;                     //Sets sun color
  final Color textColor;                    //Sets text color
  final Color cloudColor;                   //Sets cloud color
  //Offsets where the cloud/sun should be
  final double verticalOffsetPosition;
  final double cloudHorizontalOffsetPosition;
  //============================================================================

  //============================= Methods ======================================
  Offset get sunOffsetPosition => Offset(0.0, verticalOffsetPosition);
  Offset get cloudOffsetPosition =>
      Offset(cloudHorizontalOffsetPosition, verticalOffsetPosition + 0.5);
  //============================================================================

  //================================ Constructor ===============================
  ForecastAnimationState({
    this.backgroundColor,
    this.sunColor,
    this.textColor,
    this.cloudColor,
    this.verticalOffsetPosition,
    this.cloudHorizontalOffsetPosition,
  });

  factory ForecastAnimationState.stateForNextSelection(int hour, WeatherDescription condition) {
    //Breaks the day down into intervals of 3 hours
    var roundedInt = (3 * (hour / 3)).round();
    assert(roundedInt % 3 == 0);

    //Sets the offset to either 0 if it's cloud or raining or 1.2 else
    double cloudOffsetPosition =
    (condition == WeatherDescription.cloudy || condition == WeatherDescription.rain)
        ? 0.0
        : 1.2;

    //Depending on which 3 hour interval we have set up it will color the background
    //and other elements appropriately
    switch (roundedInt) {
      case 0:
        return ForecastAnimationState(
          backgroundColor: AppColor.midnightSky,
          sunColor: AppColor.midnightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.midnightCloud,
          verticalOffsetPosition: -0.10,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 3:
        return ForecastAnimationState(
          backgroundColor: AppColor.twilightSky,
          sunColor: AppColor.twilightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.twilightCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 6:
        return ForecastAnimationState(
          backgroundColor: AppColor.dawnSky,
          sunColor: AppColor.dawnSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.dawnCloud,
          verticalOffsetPosition: 0.25,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 9:
        return ForecastAnimationState(
          backgroundColor: AppColor.dawnSky,
          sunColor: AppColor.dawnSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.dawnCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 12:
        return ForecastAnimationState(
          backgroundColor: AppColor.noonSky,
          sunColor: AppColor.noonSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.noonCloud,
          verticalOffsetPosition: -0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 15:
        return ForecastAnimationState(
          backgroundColor: AppColor.noonSky,
          sunColor: AppColor.noonSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.noonCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 18:
        return ForecastAnimationState(
          backgroundColor: AppColor.duskSky,
          sunColor: AppColor.duskSun,
          textColor: AppColor.textColorDark,
          cloudColor: AppColor.duskCloud,
          verticalOffsetPosition: 0.5,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
      case 21:
      default:
        return ForecastAnimationState(
          backgroundColor: AppColor.nightSky,
          sunColor: AppColor.nightMoon,
          textColor: AppColor.textColorLight,
          cloudColor: AppColor.nightCloud,
          verticalOffsetPosition: 0.1,
          cloudHorizontalOffsetPosition: cloudOffsetPosition,
        );
    }
  }
  //============================================================================
}
