import 'package:flutter_in_action_part_2/model/weather.dart';

import 'city.dart';
import 'country.dart';

/*
This folder keeps track of the cities that the user is interested so that the
data can be gathered
 */

//All the cities that available in the list
List<City> allAddedCities = [
  City(name: "Portland", country: Country.US, active: true, listIdx: 0),
  City(name: "Berlin", country: Country.DE, active: false, listIdx: 1),
  City(name: "Buenos Aires", country: Country.BR, active: false, listIdx: 2),
  City(name: "Chaing Mai", country: Country.TH, active: false, listIdx: 3),
  City(name: "Eugene", country: Country.US, active: false, listIdx: 4),
  City(name: "Georgetown", country: Country.ZA, active: false, listIdx: 5),
  City(name: "London", country: Country.GB, active: false, listIdx: 6),
  City(name: "New York", country: Country.US, active: false, listIdx: 7),
  City(name: "Panama City", country: Country.PA, active: true, listIdx: 8),
  City(name: "San Francisco", country: Country.US, active: false, listIdx: 9),
  City(name: "Tokyo", country: Country.JP, active: false, listIdx: 10),
];

class AppSetting{
  //Selects what temperature unit we're displaying to the user
  TemperatureUnit selectedTemperature = TemperatureUnit.celsius;
  //Selects which city we should be looking at
  City activeCity = allAddedCities[0];
}
