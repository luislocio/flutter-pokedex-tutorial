// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<Pokemon> _$currentPokemonComputed;

  @override
  Pokemon get currentPokemon => (_$currentPokemonComputed ??=
          Computed<Pokemon>(() => super.currentPokemon))
      .value;
  Computed<dynamic> _$currentPokemonColorComputed;

  @override
  dynamic get currentPokemonColor => (_$currentPokemonColorComputed ??=
          Computed<dynamic>(() => super.currentPokemonColor))
      .value;

  final _$pokeAPIAtom = Atom(name: '_PokeApiStoreBase.pokeAPI');

  @override
  PokeAPI get pokeAPI {
    _$pokeAPIAtom.context.enforceReadPolicy(_$pokeAPIAtom);
    _$pokeAPIAtom.reportObserved();
    return super.pokeAPI;
  }

  @override
  set pokeAPI(PokeAPI value) {
    _$pokeAPIAtom.context.conditionallyRunInAction(() {
      super.pokeAPI = value;
      _$pokeAPIAtom.reportChanged();
    }, _$pokeAPIAtom, name: '${_$pokeAPIAtom.name}_set');
  }

  final _$currentIndexAtom = Atom(name: '_PokeApiStoreBase.currentIndex');

  @override
  dynamic get currentIndex {
    _$currentIndexAtom.context.enforceReadPolicy(_$currentIndexAtom);
    _$currentIndexAtom.reportObserved();
    return super.currentIndex;
  }

  @override
  set currentIndex(dynamic value) {
    _$currentIndexAtom.context.conditionallyRunInAction(() {
      super.currentIndex = value;
      _$currentIndexAtom.reportChanged();
    }, _$currentIndexAtom, name: '${_$currentIndexAtom.name}_set');
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.fetchPokemonList();
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentIndex(int index) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction();
    try {
      return super.setCurrentIndex(index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'pokeAPI: ${pokeAPI.toString()},currentIndex: ${currentIndex.toString()},currentPokemon: ${currentPokemon.toString()},currentPokemonColor: ${currentPokemonColor.toString()}';
    return '{$string}';
  }
}
