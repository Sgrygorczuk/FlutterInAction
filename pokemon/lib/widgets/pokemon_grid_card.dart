import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/pages/pokemon_detail_page.dart';

InkWell pokemonGridCard(BuildContext context, Pokemon poke){
  ///InkWell does an animation around the container, if you hold it it loads
  return InkWell(
    highlightColor: Colors.green,
    ///Listen to see if the Card is pushed if so we go to that pokemon's detail page
    onTap: () {
      Navigator.push(
          context,
          ///Sends us to the next page
          MaterialPageRoute(builder: (context) => PokemonDetail(poke)));
    },
    child: Hero(
      tag: poke.img,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment:
          MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ///Draws the image
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      ///We use the Network image to read HTTP, it doesn't really work on current version
                      ///at least with the type of images we're provided with
                      image: NetworkImage(poke.img))),
            ),
            ///Draws the pokemin name
            Text(
              poke.name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    ),
  );
}