import 'package:flutter/material.dart';
import 'image_card.dart';

///List of paths to the images
List<String> imgPaths = ['assets/coffee.jpg', 'assets/coffee2.jpg',
  'assets/coffee3.jpg'];

///Purpose: Creates a list view that scrolls through coffee images
///Input: Void
///Return: ListView that scrolls horizontally though images
Container imageList(){
  return Container(
    height: 125.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        for(var path in imgPaths ) buildImage(path),
      ],
    ),
  );
}