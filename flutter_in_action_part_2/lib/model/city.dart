import 'app_setting.dart';
import 'country.dart';

/*
This file holds the data about cities
 */

class City {
  //===================== Variables ============================================
  String name;            //Name of the city
  Country country;        //What country it belongs too
  bool active = false;    //Is it currently being used
  bool isDefault = false; //
  int listIdx;            //Where in the list is it
  //============================================================================

  //=================================== Constructor ============================
  City({this.name, this.country, this.active, this.listIdx}) {
    assert(name != null);                   //Make sure it has a name
    //If add it to the end of the list
    if (listIdx == null) {listIdx = allAddedCities.length + 1;}
  }
  //============================================================================

  //===================== Methods ==================================++==========
  City.fromUserInput() {
    if (this.listIdx == null) {
      this.listIdx = allAddedCities.length + 1;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is City &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              country == other.country &&
              listIdx == other.listIdx;

  @override
  int get hashCode => name.hashCode ^ country.hashCode ^ listIdx.hashCode;

  //============================================================================
}