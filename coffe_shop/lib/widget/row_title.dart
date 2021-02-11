import 'package:coffe_shop/widget/filled_in_text.dart';
import 'package:flutter/material.dart';

///Purpose: Draws a row of two text widgets, the title of the section and a fake
///         text that pretends to be a button that show all
///Input: @input takes the title of the section
///Return: Row of two text widgets
Row rowTitle(String input){
  return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: <Widget>[
        filledInText(input, 'varela', 17.0, FontWeight.normal, Color(0xFF473D3A)),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child : filledInText("See all", 'varela', 15.0, FontWeight.normal, Color(0xFFCEC7C4)),
        ),
      ]
  );
}