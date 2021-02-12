import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/widgets/pokemon_detail.dart';

class PokemonDetail extends StatelessWidget{
  //============================= Variables ====================================
  ///Holds all the info about the pokemon
  Pokemon pokemon;
  //============================================================================

  //=========================== Constructor ====================================
  PokemonDetail(Pokemon pokemon){this.pokemon = pokemon;}
  //============================================================================

  //=============================== Widget =====================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        ///We tell app bar how much shadow we want
        elevation: 0.0,
        title: Text(
            pokemon.name
        ),
        backgroundColor: Colors.cyan,
      ),
      body: pokemonDetails(context, pokemon),
    );
  }
  //============================================================================
}