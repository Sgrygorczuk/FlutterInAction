import 'package:flutter/material.dart';

class ColorTransitionIcon extends AnimatedWidget {
  //========================= Variables ========================================
  final IconData icon;
  final double size;
  //============================================================================

  //================================= Constructor ==============================
  ColorTransitionIcon({this.icon, this.size, Key key, Animation<Color> animation,})
      : super(key: key, listenable: animation);
  //============================================================================

  //=============================== Widget =====================================
  //Gives back an animated icon
  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    return Icon(icon, color: animation.value, size: size,);
  }
  //============================================================================
}
