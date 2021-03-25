import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_new/model/pokemon_model.dart';
import 'package:pokemon_new/model/set_model.dart';

const String url = 'https://api.pokemontcg.io/v2/';

Future<PokemonModel> getPokemon() async {
  var response = await http.get(url);
  Map<String, dynamic> responseJson = jsonDecode(response.body);
  return PokemonModel.fromJSON(responseJson);
}

Future<List<PokemonModel>> getPokemons() async {
  var response = await http.get(
    url + 'cards',
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
  // var logger = Logger();
  // var response = await http.get(
  //   url + 'sets',
  //   headers: {'X-Api-Key': "e19564a2-37e5-45e6-bd36-a08f25bf3879"},
  // );
  var sets = <SetModel>[];

  // if (response.statusCode == 200) {
  // Map<String, dynamic> jsonResponse = json.decode(response.body);
  // jsonResponse['data'].forEach((set) {
  //   sets.add(new SetModel.fromJSON(set));
  // });
  if (true) {
    sets = [
      SetModel('1', 'name', 'series', 1, 1, 'ptcgoCode', 'releaseDate',
          'symbol', 'logo'),
      SetModel('2', 'name', 'series', 1, 1, 'ptcgoCode', 'releaseDate',
          'symbol', 'logo')
    ];
    return sets;
  } else {
    throw Exception('Failed to load pokemons from API');
  }
}
