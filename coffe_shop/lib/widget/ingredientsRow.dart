import 'package:flutter/material.dart';
import 'filled_in_text.dart';

Row ingredientsRow(String title, String info){
  return Row(
      children: [
        filledInText(title, 'nunito', 14.0, FontWeight.normal, Color(0xFF726B68)),
        SizedBox(width: 15.0),
        filledInText(info, 'nunito', 12.0, FontWeight.bold, Color(0xFF726B68)),
      ]
  );
}