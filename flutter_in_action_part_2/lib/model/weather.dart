import 'city.dart';

class Forecast {
  //================================= Variables ================================
  City city;              //Grabs the city we're looking at
  List<ForecastDay> days; //List of forecaster's that have a list of weather by the hour for each day
  //============================================================================

  //===================================== Constructor ==========================
  Forecast({this.city, this.days});
  //============================================================================

  //============================== Method ======================================
  //Checks what day it is and the selects the given day in the forecast list
  static ForecastDay getSelectedDayForecast(Forecast forecast, DateTime selectedDate) {
    return forecast.days.firstWhere((ForecastDay d) => d.date.day == selectedDate.day);
  }
  //============================================================================

}

class ForecastDay {
  //================================= Variables ================================
  List<Weather> hourlyWeather; //Holds the weather prediction by the hour
  DateTime date;               //Holds the days date
  int min;
  int max;
  //============================================================================

  //===================================== Constructor ==========================
  ForecastDay({this.hourlyWeather, this.date, this.min, this.max});
  //============================================================================

  //============================== Method ======================================
  //Check the weather list and sees what the weather is at the given hour
  static Weather getWeatherForHour(ForecastDay self, int hour) {
    if (hour == 0) {
      // DateTime hours run 1,2,3...22,23,0
      // 0 == midnight
      return self.hourlyWeather.last;
    }
    return self.hourlyWeather.firstWhere((Weather w) => w.dateTime.hour >= hour);
  }
//============================================================================
}

class Weather {
  //=================== Variables ==============================================
  City city;
  DateTime dateTime;
  Temperature temperature;
  WeatherDescription description;
  int cloudCoveragePercentage;
  String weatherIcon;
  //============================================================================

  Weather({this.city, this.dateTime, this.temperature, this.description,
    this.cloudCoveragePercentage, this.weatherIcon});

  //====================== Methods =============================================
  static Map<WeatherDescription, String> displayValues = {
    WeatherDescription.clear: "Clear",
    WeatherDescription.cloudy: "Cloudy",
    WeatherDescription.rain: "Rain",
    WeatherDescription.sunny: "Sunny",
  };
  //============================================================================
}

class Temperature {
  //===================== Variables ============================================
  int current;
  TemperatureUnit temperatureUnit;
  //============================================================================

  //====================== Constructor =========================================
  //Assigns the current number and what unit we have
  Temperature({this.current, this.temperatureUnit});
  //============================================================================

  //======================== Methods ===========================================
  //Converts from celsius to fahrenheit
  static int celsiusToFahrenheit(int temp) => (temp * 9 / 5 + 32).floor();
  //============================================================================
}

//Types of Temp Units
enum TemperatureUnit { celsius, fahrenheit }

//Text for user
enum WeatherDescription { clear, cloudy, sunny, rain }
