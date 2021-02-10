import 'package:flutter/material.dart';

class ColorTransitionBox extends AnimatedWidget {
  //=============================== Variables ==================================
  final Widget child;
  //============================================================================

  //============================== Constructor =================================
  ColorTransitionBox({this.child, Key key, Animation<Color> animation,})
      : super(key: key, listenable: animation);
  //============================================================================

  //================================== Widget ==================================
  //Animated from the current color to the chosen color
  @override
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: animation.value,
      ),
      child: child,
    );
  }
  //============================================================================
}
