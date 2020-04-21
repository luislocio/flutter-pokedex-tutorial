import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/poke_api.dart';
import 'package:pokedex/pages/home_page/widgets/app_bar_home.dart';
import 'package:pokedex/pages/home_page/widgets/poke_item.dart';
import 'package:pokedex/pages/poke_detail/poke_detail.dart';
import 'package:pokedex/stores/pokeapi_store.dart';

class HomePage extends StatelessWidget {
  final PokeApiStore _pokemonStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4),
            left: ConstsApp.screenWidth(context) - (240 / 1.5),
            child: Opacity(
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Column(
            children: <Widget>[
              Container(height: ConstsApp.statusBarHeight(context)),
              AppBarHome(),
              Expanded(
                child: Observer(
                  builder: (context) {
                    PokeAPI _pokeApi = _pokemonStore.pokeAPI;
                    return _pokeApi != null
                        ? GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: _pokeApi.pokemonList.length,
                            itemBuilder: (context, index) {
                              Pokemon pokemon = _pokemonStore.getPokemon(index: index);

                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: GestureDetector(
                                    child: PokeItem(
                                      pokemon: pokemon,
                                      image: _pokemonStore.getImage(number: pokemon.pokeNum, size: 90),
                                    ),
                                    onTap: () {
                                      _pokemonStore.setCurrentIndex(index);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PokeDetail()));
                                    },
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
