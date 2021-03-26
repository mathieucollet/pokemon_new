import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_new/model/set_model.dart';

import '../constants.dart';

const String setUrl = BASE_URL + 'sets/';

Future<List<SetModel>> getSets() async {
  var response = await http.get(
    setUrl + '?orderBy=-releaseDate',
    headers: HEADERS,
  );
  var sets = <SetModel>[];

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    jsonResponse['data'].forEach((set) {
      sets.add(new SetModel.fromJSON(set));
    });
    return sets;
  } else {
    throw Exception('Failed to load sets from API');
  }
}
