import 'package:flutter/material.dart';

///Purpose: Create a circular image
///Input: @tag not sure why we got it but we do
///       @radius tells us the radius of the circle
///       @asset point to the image we want to use
///       @imageType a bool that tells us if we're doign a imageType or backgroundImage
///Return: The image Hero widget
Hero profile(String tag, double radius, String asset, bool imageType) {
  return Hero(
    tag: tag,
    child : Padding(
      padding: EdgeInsets.all(16.0),
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: radius,
          //Used to in case the jgp into a circular shape
          backgroundImage: imageType ? null : AssetImage(asset),
          //Used to create a child for the png
          child: imageType ? Image.asset(asset) : null
      ),
    )
  );
}