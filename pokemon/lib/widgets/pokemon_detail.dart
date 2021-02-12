import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/widgets/filledInText.dart';
import 'package:pokemon/widgets/row_list.dart';

///Creates the majority of the details page
///Input: @context allows us to get the data about the screen
///       @pokemon gathers all the data about the pokemon we're looking at
///Return: Stack of the pokemon image and their data
Stack pokemonDetails(BuildContext context, Pokemon pokemon){
  return Stack(
    children: [
      ///Displays all the pokemon text data
      Positioned(
        ///Makes the smaller and lower on screen
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          ///Rounds out the box
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          ///Text data
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              filledInText(pokemon.name, "roboto", 24.0, FontWeight.bold),
              SizedBox(height: 8.0),
              filledInText("Height: " + pokemon.height, "roboto", 14.0),
              SizedBox(height: 8.0),
              filledInText("Weight: " + pokemon.weight, "roboto", 14.0),
              SizedBox(height: 10.0),
              filledInText("Types", "roboto", 16.0, FontWeight.bold),
              rowList(pokemon.type, Colors.yellow),
              SizedBox(height: 10.0),
              filledInText("Weakness", "roboto", 16.0, FontWeight.bold),
              rowList(pokemon.weaknesses, Colors.purple),
              SizedBox(height: 10.0),
              filledInText("Next Evolution", "roboto", 16.0, FontWeight.bold),
              pokemon.nextEvolution.isEmpty ? filledInText("No Evolution") : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ///Since types are a list we can filled out the row with them
                children: pokemon.nextEvolution.map((listData) => FilterChip(
                  label: Text(
                      listData.name
                  ),
                  backgroundColor: Colors.blue,
                  onSelected: (bool value) {},
                )
                ).toList()
              )
            ]
          )
        )
      ),
      ///Sets up the image that cannot be loaded
      Align(
        alignment: Alignment.topCenter,
        child: Hero(
            tag: pokemon.img,
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
            )),
      )
    ],
  );
}