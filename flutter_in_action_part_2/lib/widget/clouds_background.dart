import 'package:flutter/material.dart';

//Clouds class that make the widget
class Clouds extends AnimatedWidget {
  //============================ Variables =====================================
  //Checks if it is raining
  final bool isRaining;
  //============================================================================

  //===================== Constructor ==========================================
  Clouds({Key key, Animation<Color> animation, this.isRaining = false,}) :
        super(key: key, listenable: animation);
  //============================================================================

  //============================= Widget =======================================
  Widget build(BuildContext context) {
    final Animation<Color> animation = listenable;

    var screenSize = MediaQuery.of(context).size;
    var _paintBrush = Paint()
      ..color = animation.value
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    return Container(
      height: 300.0,
      child: CustomPaint(
        size: screenSize,
        painter: CloudPainter(
          cloudPaint: _paintBrush,
          isRaining: isRaining,
        ),
      ),
    );
  }
  //============================================================================
}

//Logic Class that takes care of how it's drawn
class CloudPainter extends CustomPainter {
  //======================= Variables ==========================================
  final Paint cloudPaint;
  final bool isRaining;
  //============================================================================

  //=================== Constructor ============================================
  CloudPainter({this.cloudPaint, this.isRaining});
  //============================================================================

  //=============================== Methods ====================================
  @override
  void paint(Canvas canvas, Size size) {
    //Sets up dimensions
    var rectTop = 110.0;
    var rectBottom = rectTop + 40.0;
    var figureLeftEdge = size.width / 4;
    var figureRightEdge = size.width - 90.0;
    var figureCenter = size.width / 2;

    //Draws few rectangles with rounded edges to use as bottom of the cloud
    var cloudBaseRect = Rect.fromPoints(
      Offset(figureLeftEdge, rectTop),
      Offset(figureRightEdge, rectBottom),
    );
    var cloudBase = RRect.fromRectAndRadius(
      cloudBaseRect,
      Radius.circular(10.0),
    );

    //Draws three circles onto of that base
    canvas.drawCircle(Offset(figureLeftEdge + 5, 100.0), 50.0, cloudPaint);
    canvas.drawCircle(Offset(figureCenter, 70.0), 60.0, cloudPaint);
    canvas.drawCircle(Offset(figureRightEdge, 70.0), 80.0, cloudPaint);

    //Set up paint data and draws the clouds
    cloudPaint.strokeWidth = 3.0;
    canvas.drawRRect(cloudBase, cloudPaint);

    //If there is rain
    if (isRaining) {
      //Sets up raindrop data
      var rainDropLength = 75.0;
      var rainDropOffsetXStart = figureLeftEdge;
      var rainDropOffsetXEnd = rainDropOffsetXStart * 0.8;
      var rainDropOffsetXNext = (figureRightEdge - figureLeftEdge) / 10;
      var rainDropOffsetYStart = rectBottom + 15.0;

      //Draws 10 rain drops
      for (var i = 0; i < 10; i++) {
        rainDropOffsetXStart += rainDropOffsetXNext;
        rainDropOffsetXEnd += rainDropOffsetXNext;
        if (i.isEven) {rainDropOffsetYStart += 7.0;}
        else {rainDropOffsetYStart -= 7.0;}
        canvas.drawLine(Offset(rainDropOffsetXStart, rainDropOffsetYStart),
            Offset(rainDropOffsetXEnd, rainDropOffsetYStart + rainDropLength), cloudPaint);
      }
    }
  }

  //Tells us if we should repaint or not
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
