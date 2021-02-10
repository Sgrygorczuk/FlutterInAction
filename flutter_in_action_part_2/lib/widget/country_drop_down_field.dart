import 'package:flutter/material.dart';
import 'package:flutter_in_action_part_2/model/country.dart';

import 'expanded_drop_down.dart';

class CountryDropdownField extends StatelessWidget {
  final Function onChanged;
  final Country country;

  const CountryDropdownField({
    Key key,
    this.onChanged,
    this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropDownExpanded<Country>(
        isExpanded: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Country",
        ),
        //Checks if there si a value otherwise assigns it one
        value: country ?? Country.AD,
        onChanged: (Country newSelection) => onChanged(newSelection),
        //Populates the drop down menu with the list of coutnries
        items: Country.ALL.map((Country country) {
          return DropdownMenuItem(value: country, child: Text(country.name));
        }).toList(),
      ),
    );
  }
}
