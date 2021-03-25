import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pokemon_new/model/pokemon_model.dart';
import 'package:pokemon_new/model/set_model.dart';

const String url = 'https://api.pokemontcg.io/v2/';

Future<PokemonModel> getPokemon() async {
  var response = await http.get(url + 'cards');
  Map<String, dynamic> responseJson = jsonDecode(response.body);
  return PokemonModel.fromJSON(responseJson);
}

Future<List<PokemonModel>> getPokemons([String setId]) async {
  String getPokemonsUrl = url + 'cards';
  if (setId != null) {
    getPokemonsUrl += '?q=set.id:' + setId;
  }
  var response = await http.get(
    getPokemonsUrl,
    headers: {'X-Api-Key': "e19564a2-37e5-45e6-bd36-a08f25bf3879"},
  );
  var pokemons = <PokemonModel>[];
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    jsonResponse['data'].forEach((pokemon) {
      pokemons.add(new PokemonModel.fromJSON(pokemon));
    });
    return pokemons;
  } else {
    throw Exception('Failed to load pokemons from API');
  }
}

Future<List<SetModel>> getSets() async {
  var response = await http.get(
    url + 'sets',
    headers: {'X-Api-Key': "e19564a2-37e5-45e6-bd36-a08f25bf3879"},
  );
  var sets = <SetModel>[];

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    jsonResponse['data'].forEach((set) {
      var logger = Logger();
      logger.d(set);
      sets.add(new SetModel.fromJSON(set));
    });
    return sets;
  } else {
    throw Exception('Failed to load sets from API');
  }
}
