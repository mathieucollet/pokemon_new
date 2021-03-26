import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_new/model/pokemon_model.dart';

import '../constants.dart';

const String pokemonUrl = BASE_URL + 'cards/';

Future<PokemonModel> getPokemon({String cardId}) async {
  var response = await http.get(pokemonUrl + cardId, headers: HEADERS);
  Map<String, dynamic> responseJson = jsonDecode(response.body);
  return PokemonModel.fromJSON(responseJson["data"]);
}

Future<List<PokemonModel>> getPokemons({String setId}) async {
  String queryParams = '?orderBy=set.id,number';
  if (setId != null) {
    queryParams += '&q=set.id:' + setId;
  }
  var response = await http.get(
    pokemonUrl + queryParams,
    headers: HEADERS,
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
