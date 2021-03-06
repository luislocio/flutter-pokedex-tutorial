import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/poke_api.dart';

class PokeItem extends StatelessWidget {
  final Pokemon pokemon;
  final Widget image;

  const PokeItem({Key key, this.pokemon, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: ConstsApp.getColorType(type: pokemon.types[0]), borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '#${pokemon.pokeNum}',
                      style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      pokemon.name,
                      style: TextStyle(
                        fontFamily: 'Google',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    buildTypeChips()
                  ],
                ),
              ),
              Hero(
                tag: pokemon.pokeNum,
                child: Opacity(
                  child: Image.asset(ConstsApp.whitePokeball, height: 140, width: 140),
                  opacity: 0.1,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: image,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTypeChips() {
    List<Widget> chips = List<Widget>();
    for (var type in pokemon.types) {
      chips.add(Opacity(
        opacity: 0.7,
        child: Chip(label: Text(type, style: TextStyle(fontFamily: 'Google'))),
      ));
    }
    return Column(
      children: chips,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
