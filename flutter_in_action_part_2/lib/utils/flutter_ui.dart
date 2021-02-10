import 'package:flutter/material.dart';

//56 is the default size of a toolbar
final double kToolbarHeight = 56.0;
//Returns the height of the toolbar to be drawn
double appBarHeight(BuildContext context) {
  return screenAwareSize(kToolbarHeight, context);
}

//"Average" height of the screen
const double kBaseHeight = 650.0;
//Calculates how big the app bar should be based on the screen size and padding
double screenAwareSize(double size, BuildContext context) {
  double drawingHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / kBaseHeight;
}
