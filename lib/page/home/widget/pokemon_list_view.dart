import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_new/api/pokemon_api.dart';
import 'package:pokemon_new/model/pokemon_model.dart';
import 'package:pokemon_new/page/pokemon/pokemon_page.dart';
import 'package:pokemon_new/style/colors.dart';

class PokemonListView extends StatelessWidget {
  String setId;

  PokemonListView({this.setId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: setId != null ? getPokemons(setId: setId) : getPokemons(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> data = snapshot.data;
          return _pokemonGridView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

  GridView _pokemonGridView(data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 8,
        maxCrossAxisExtent: 200,
        mainAxisExtent: 250,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PokemonPage.set(
                    cardId: data[index].id, set: data[index].set),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: data[index].smallImage,
              placeholder: (context, url) => CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation(red),
              ),
            ),
          ),
        );
      },
    );
  }
}
