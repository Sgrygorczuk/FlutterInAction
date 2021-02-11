import 'package:flutter/material.dart';

Positioned userImage(double distance, String imgPath){
  return Positioned(
      left: distance,
      child: Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.5),
              border: Border.all(
                  color: Color(0xFFF3B2B7),
                  style: BorderStyle.solid,
                  width: 1.0
              ),
              image: DecorationImage(
                  image: AssetImage(imgPath),
                  fit: BoxFit.cover
              )
          )
      )
  );
}