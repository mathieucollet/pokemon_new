import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_new/api/pokemon_api.dart';
import 'package:pokemon_new/model/pokemon_model.dart';

class PokemonListView extends StatelessWidget {
  String _setId;

  PokemonListView();

  PokemonListView.set(this._setId);

  @override
  Widget build(BuildContext context) {
    Future<List> list = getSets();
    return FutureBuilder<List<PokemonModel>>(
      future: _setId != null ? getPokemons(_setId) : getPokemons(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> data = snapshot.data;
          return _pokemonListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  ListView _pokemonListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].name, data[index].smallImage);
        });
  }

  ListTile _tile(String title, String imageUrl) => ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        onTap: () {},
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        leading: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 40.0,
        ),
      );
}
