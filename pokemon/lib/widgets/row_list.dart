import 'package:flutter/material.dart';

///Purpose: create a row of FilterChips using a list of strings
///Input: @list presumbaly a list of string used for the text
///       @color color  of the filterchip
///Return: a row of filterchips 
Row rowList(List list, Color color){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    ///Since types are a list we can filled out the row with them
    children: list.map((listData) => FilterChip(
      label: Text(
          listData
      ),
      backgroundColor: color,
      onSelected: (bool value) {},
    )
    ).toList(),
  );
}