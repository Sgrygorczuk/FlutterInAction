
import 'package:flutter/cupertino.dart';

import 'coffee_list_card.dart';

Container coffeeCardScroll(){
  return Container(
    height: 410.0,
    width: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        coffeeListCard(
            "assets/starbucks.png",
            "Caffe Misto",
            "Coffeeshop",
            "Our dark, rich espresso balanced with steamed milk and a light layer of foam",
            "\$4.99",
            false
        ),
        coffeeListCard(
            "assets/starbucks.png",
            "Caffe Misto",
            "Brownhouse",
            "Rich full-bodied epresso with bittersweet milk sause and steamed milk",
            "\$3.99",
            false
        ),
      ],
    ),
  );
}