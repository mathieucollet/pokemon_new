import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_new/api/pokemon_api.dart';
import 'package:pokemon_new/component/my_scaffold.dart';
import 'package:pokemon_new/model/pokemon_model.dart';
import 'package:pokemon_new/model/set_model.dart';
import 'package:pokemon_new/style/colors.dart';

class PokemonPage extends StatefulWidget {
  String cardId;
  SetModel set;

  PokemonPage.set({this.cardId, this.set});

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    var body = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: FutureBuilder<PokemonModel>(
          future: getPokemon(cardId: this.widget.cardId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              PokemonModel pokemon = snapshot.data;
              return Container(
                // height: ,
                child: Wrap(children: <Widget>[_pokemonCard(pokemon)]),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
    return MyScaffold(
      body: body,
      goBackToSet: this.widget.set,
      goBackToMain: this.widget.set == null,
    );
  }

  Card _pokemonCard(PokemonModel pokemon) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                width: 48,
                height: 48,
                child: CachedNetworkImage(
                  imageUrl: pokemon.set.symbol,
                ),
              ),
              title: Row(
                children: [
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(pokemon.number + ' / ' + pokemon.set.total.toString())
                ],
              ),
              subtitle: Text(
                pokemon.types.join(', '),
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            CachedNetworkImage(
              imageUrl: pokemon.image,
              placeholder: (context, url) => CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation(red),
              ),
            ),
          ],
        ));
  }
}
