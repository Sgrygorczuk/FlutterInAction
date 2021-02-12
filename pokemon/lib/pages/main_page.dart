import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/widgets/loading.dart';
import 'package:pokemon/widgets/pokemon_grid_card.dart';

///Stateless widgets don't need a Logic class
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //====================== Variables ===========================================
  ///The data for the pokemon
  var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokemonHub pokemonHub;
  //============================================================================

  //===================== Methods ==============================================
  ///Purpose:This is the initial state that will execute before
  ///making any widgets gathering the data
  ///Input: Void
  ///Return: Void
  @override
  void initState() {
    print("Called Init");
    super.initState();
    fetchData();
    ///Update the state once the data is done
    setState(() {});
  }

  ///Purpose: Grab the data asynchronously
  ///Input: Void
  ///Return: Void
  void fetchData() async{
    ///The data will take a long time to process so we use the await
    ///to make sure that the data is full download before proceeding
    var data = await http.get(url);
    ///Converts the data to readable
    var decodedData = jsonDecode(data.body);
    ///Pushes all the data to the model
    pokemonHub = PokemonHub.fromJson(decodedData);
    print(data.body);
  }
  //============================================================================

  //===================================== Widgets ==============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
          "Poke App",
          ),
          backgroundColor: Colors.cyan,
      ),
      ///Drawers is a natural widget of scaffold
      drawer: Drawer(
      ),
      ///We do a check to see if the pokemon hub is empty,
      ///if it is we show it a loading screen else we display the data
      body: pokemonHub == null ? loading() : GridView.count(
        ///Tells us how many rows this view will use
        crossAxisCount: 2,
        ///Reads the pokemonHub class and makes a box for each pokemon
        children: pokemonHub.pokemon.map((poke) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            ///Adds a little shadow under the card
            elevation: 5.0,
            child: pokemonGridCard(context, poke),
          ),
        )).toList(),
      ),
    );
  }
}
