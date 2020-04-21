import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/poke_api.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:simple_animations/simple_animations.dart';

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
              cornerRadius: 40,
              builder: (_, __) {
                return Container(height: ConstsApp.screenHeight(context));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) => _pokemonStore.setCurrentIndex(index),
                  itemCount: _pokemonStore.pokeAPI.pokemonList.length,
                  itemBuilder: (_, index) {
                    Pokemon pokemon = _pokemonStore.pokeAPI.pokemonList[index];
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        ControlledAnimation(
                          playback: Playback.MIRROR,
                          duration: _animation.duration,
                          tween: _animation,
                          builder: (context, animation) {
                            return Transform.rotate(
                              angle: animation['rotation'],
                              child: Hero(
                                tag: pokemon.pokeNum,
                                child: Opacity(
                                  child: Image.asset(ConstsApp.whitePokeball),
                                  opacity: 0.2,
                                ),
                              ),
                            );
                          },
                        ),
                        AnimatedPadding(
                            curve: Curves.bounceInOut,
                            duration: Duration(milliseconds: 400),
                            padding: EdgeInsets.all(index == _pokemonStore.currentIndex ? 0 : 60),
                            child: _pokemonStore.getImage(number: pokemon.pokeNum, size: 160)),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  MultiTrackTween _animation = MultiTrackTween(
    [
      Track("rotation").add(
        Duration(seconds: 7),
        Tween(begin: 0.0, end: 6),
        curve: Curves.elasticIn,
      ),
    ],
  );
}
