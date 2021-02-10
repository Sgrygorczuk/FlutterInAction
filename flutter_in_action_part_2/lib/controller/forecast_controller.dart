import 'package:flutter_in_action_part_2/model/city.dart';
import 'package:flutter_in_action_part_2/model/weather.dart';
import 'package:flutter_in_action_part_2/utils/generate_weather_data.dart';

class ForecastController {
  //============================== Variables ===================================
  City _city;                        //City we're looking at
  Forecast forecast;                 //What is the forecast for this week
  ForecastDay selectedDay;           //What is the forecast for this day
  Weather selectedHourlyTemperature; //What is the weather at this hour
  DateTime _today = DateTime.now();  //Today info
  WeatherDataRepository _repository = WeatherDataRepository(); //Our fake weather forecast data
  //============================================================================

  //======================= Constructor ========================================
  ForecastController(this._city) {init();}
  //============================================================================

  //=================================== Methods ================================
  //Returns city
  City get city => _city;

  //Sets the city and updates the data to revolve around that city
  set city(City value) {
    _city = value;
    init();
  }

  //Sets up all the data
  init() {
    //Grabs the forecast data from the database for the selected city
    forecast = _repository.getTenDayForecast(city);
    //Grabs the data for this day of the week
    selectedDay = Forecast.getSelectedDayForecast(
      forecast,
      DateTime(_today.year, _today.month, _today.day,),
    );
    //Gets this hours weather
    selectedHourlyTemperature = ForecastDay.getWeatherForHour(
      selectedDay,
      DateTime.now().toLocal().hour,
    );
  }
  //============================================================================
}
