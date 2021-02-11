import 'package:flutter/material.dart';

Padding ingredientsCard(String name, Icon icon, Color color){
  return Padding(
      padding: EdgeInsets.only(right: 10),
    child: Column(
      children: [
        Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: color
            ),
            child: Center(
                child: icon
            )
        ),
        SizedBox(height: 4.0),
        Container(
          width: 60,
          child: Center(
            child: Text(
                name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 12.0,
                        color: Color(0xFFC2C0C0)
                    )
                )
            )
          )
      ]
    ),
  );
}