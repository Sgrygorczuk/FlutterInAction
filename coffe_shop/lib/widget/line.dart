import 'package:flutter/material.dart';

///Purpose: Draw a line that helps to separate sections of widgets
///Input: Void
///Return: Padding showing a small gray line
Padding line(){
  return Padding(
    padding: const EdgeInsets.only(right: 35.0),
    child: Container(
      height: 0.5,
      color: Color(0xFFC6C4C4),
    ),
  );
}