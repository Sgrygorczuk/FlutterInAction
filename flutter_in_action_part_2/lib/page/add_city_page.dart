import 'package:flutter/material.dart';
import 'package:flutter_in_action_part_2/model/app_setting.dart';
import 'package:flutter_in_action_part_2/model/city.dart';
import 'package:flutter_in_action_part_2/widget/country_drop_down_field.dart';

import '../styles.dart';

class AddNewCityPage extends StatefulWidget {
  //=========================== Variables ======================================
  final AppSetting settings;
  //============================================================================

  //================================ Constructor ===============================
  const AddNewCityPage({Key key, this.settings}) : super(key: key);
  //============================================================================

  //===================== Methods ==============================================
  @override
  _AddNewCityPageState createState() => _AddNewCityPageState();
  //============================================================================
}

class _AddNewCityPageState extends State<AddNewCityPage> {
  //==================================== Variables =============================
  City _newCity = City.fromUserInput();
  //Checks if any of the forms have been changed
  bool _formChanged = false;
  bool _isDefaultFlag = false;
  //This is used to update the state of the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Used to keep track of focus on item boxes, can be used to automatically
  //Find an empty box and focus on it if the user missed filling it out
  FocusNode focusNode;
  //============================================================================

  //================================= Methods ==================================
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // clean up the focus node when this page is destroyed.
    focusNode.dispose();
    super.dispose();
  }

  bool validateTextFields() {
    return _formKey.currentState.validate();
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }

  void _handleAddNewCity() {
    final city = City(
      name: _newCity.name,
      country: _newCity.country,
      active: true,
    );

    allAddedCities.add(city);
  }

  //============================================================================

  //==================================== Widgets ===============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add City",
          style: TextStyle(color: AppColor.textColorLight),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //Here is where the form tree starts
        child: Form(
          //This is used to update the state of the form
          key: _formKey,
          //Checks if any of the forms changed
          onChanged: _onFormChange,
          //Checks if user is leaving the page
          onWillPop: _onWillPop,
          child: ListView(
            //ShrinkWrap tells the ListView to try ot be the size of it's children
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                //Input box
                child: TextFormField(
                  //Where the data will go from the text box
                  onSaved: (String val) => _newCity.name = val,
                  //Input decorations is only used for text box widgets
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: "Required",
                    labelText: "City name",
                  ),
                  //Made sure that this is the first text box that's highlighted
                  autofocus: true,
                  autovalidate: _formChanged,
                  //Checking if the correct input has been provided
                  //Right now it's just checking if its blank or not
                  validator: (String val) {
                    if (val.isEmpty) return "Field cannot be left blank";
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                //Input box
                child: TextFormField(
                  //Tells that this field has the focus node on it
                  focusNode: focusNode,
                  onSaved: (String val) => print(val),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: "Optional",
                    labelText: "State or Territory name",
                  ),
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Field cannot be left blank";
                    }
                    return null;
                  },
                ),
              ),
              //Drop down menu
              CountryDropdownField(
                country: _newCity.country,
                onChanged: (newSelection) {
                  setState(() => _newCity.country = newSelection);
                },
              ),
              FormField(
                onSaved: (val) => _newCity.active = _isDefaultFlag,
                builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Default city?"),
                      Checkbox(
                        value: _isDefaultFlag,
                        onChanged: (val) {
                          setState(() => _isDefaultFlag = val);
                        },
                      ),
                    ],
                  );
                },
              ),
              Divider(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        textColor: Colors.red[400],
                        child: Text("Cancel"),
                        onPressed: () async {
                          if (await _onWillPop()) {
                            Navigator.of(context).pop(false);
                          }
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blue[400],
                      child: Text("Submit"),
                      //Checks if the form has been change otherwise the button
                      //is grayed out
                      onPressed: _formChanged
                          ? () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          _handleAddNewCity();
                          Navigator.pop(context);
                        } else {
                          //Checks if focus has been fulfilled everywhere
                          FocusScope.of(context).requestFocus(focusNode);
                        }
                      }
                          : null,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Are you sure you want to abandon the form? Any changes will be lost."),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(false),
              textColor: Colors.black,
            ),
            FlatButton(
              child: Text("Abandon"),
              textColor: Colors.red,
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ) ??
            false;
      },
    );
    //============================================================================
  }
}
