import 'package:flutter/material.dart';

///Purpose: Clean up page screens by making a text widget with a single function call
/// Input: @title the text that the widget says
///        @family the font style
///        @size the font size
///        @fontWeight the fontWeight of the text
///        @color the color of the text
/// Return: Gives back a custom text widget
Text filledInText(String title, String family, double size, FontWeight fontWeight, Color color){
  return Text(
        title,
        style: TextStyle(
            fontFamily: family,
            fontSize: size,
            fontWeight: fontWeight,
            color: color
        ),
  );
}
