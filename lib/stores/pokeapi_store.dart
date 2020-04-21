import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/poke_api.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI pokeAPI;

  @action
  fetchPokemonList() {
    loadPokeAPI().then((pokeList) {
      pokeAPI = pokeList;
    });
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(ConstsAPI.pokeApiUrl);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      return null;
    }
  }

  Widget getImage({String number, double size}) {
    return CachedNetworkImage(
      height: size,
      width: size,
      imageUrl: ConstsAPI.pokeImgUrl + '$number.png',
      placeholder: (_, __) => Container(color: Colors.transparent),
    );
  }
}
