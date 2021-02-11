
import 'package:flutter/material.dart';

Column stackTextRow(double height, String string, String family, double size, FontWeight fontWeight, Color color){
  return Column(
      children : [
        SizedBox(
          height: height,
        ),
        Text(
          string,
          style: TextStyle(
            fontFamily: family,
            fontSize: size,
            fontWeight: fontWeight,
            color : color,
          ),
        ),
      ]
  );
}

Padding coffeeListCard(String imgPath, String coffeeName, String shopName, String description, String price, bool isFavorite){
  return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
    child: Container(
      height: 300,
      width: 255,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 335.0,
              ),
              Positioned(
                top: 75.0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    height: 260.0,
                    width: 225.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFDAB68C)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        stackTextRow(60, shopName + '\'s', 'nunito', 14.0, FontWeight.bold, Colors.white),
                        stackTextRow(10, coffeeName, 'varela', 32.0, FontWeight.bold, Colors.white),
                        stackTextRow(10, description, 'nunito', 14.0, FontWeight.normal, Colors.white),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            stackTextRow(0, price, 'varela', 25.0, FontWeight.bold, Color(0xFF3A4742)),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white
                              ),
                              child: Center(
                                child: Icon(
                                    Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                  size : 15.0
                                )
                              )
                            )
                          ]
                        )
                      ]
                    )
                  )
              ),
              Positioned(
                left : 60,
                top: 25.0,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.contain
                    )
                  )
                )
              )
            ]
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: (){
              /*
              Navigator.of(context).push(MaterialPageRoute(
                  builder: context => DetailsPage())
              );
              */
            },
            child : Container(
              height: 50.0,
              width: 225.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xFF473D3A)
              ),
              child: Center(
                child: Text(
                  "Order Now",
                  style: TextStyle(
                    fontFamily: "nuito",
                    fontSize : 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            )
          )
        ],
      ),
    ),
  );
}