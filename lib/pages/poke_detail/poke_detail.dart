import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/poke_api.dart';
import 'package:pokedex/stores/pokeapi_store.dart';

import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetail extends StatefulWidget {
  @override
  _PokeDetailState createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  PokeApiStore _pokemonStore = GetIt.instance<PokeApiStore>();
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _pokemonStore.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: _pokemonStore.currentPokemonColor,
          elevation: 0,
          title: Opacity(
            opacity: 1,
            child: Text(
              _pokemonStore.currentPokemon.name,
              style: TextStyle(fontFamily: 'Google', fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          actions: <Widget>[IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})],
        ),
        body: Stack(
          children: <Widget>[
            Container(color: _pokemonStore.currentPokemonColor),
            Container(
              color: _pokemonStore.currentPokemonColor,
              height: ConstsApp.screenHeight(context, dividedBy: 3),
            ),
            SlidingSheet(
              snapSpec: const SnapSpec(snappings: [0.7, 1.0]),
              cornerRadius: 16,
              builder: (_, __) {
                return Container(height: ConstsApp.screenHeight(context));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) => _pokemonStore.setCurrentIndex(index),
                  itemCount: _pokemonStore.pokeAPI.pokemonList.length,
                  itemBuilder: (_, index) {
                    Pokemon pokemon = _pokemonStore.pokeAPI.pokemonList[index];
                    return _pokemonStore.getImage(number: pokemon.pokeNum);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
