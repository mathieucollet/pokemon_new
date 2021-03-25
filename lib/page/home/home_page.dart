import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_new/api/pokemon_api.dart';
import 'package:pokemon_new/model/pokemon_model.dart';
import 'package:pokemon_new/model/set_model.dart';
import 'package:pokemon_new/page/home/widget/pokemon_list_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonModel _pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text('Pokemon TCG App'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              PokemonModel pokemonModel = await getPokemon();
              setState(() {
                _pokemonModel = pokemonModel;
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: _drawerBuilder(),
      ),
      body: Center(
        child: PokemonListView(),
      ),
    );
  }

  Widget _buildContent() {
    if (_pokemonModel == null) {
      return Center(
        child: Text('Snif snif, no pokemon'),
      );
    } else {
      return Column(
        children: [
          Text(_pokemonModel.name),
          Container(height: 21.0),
          CachedNetworkImage(imageUrl: _pokemonModel.image),
        ],
      );
    }
  }

  Widget _drawerBuilder() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<SetModel>> projectSnap) {
        if (projectSnap.hasData == false) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        return ListView.builder(
          itemCount: projectSnap.data.length,
          itemBuilder: (context, index) {
            SetModel model = projectSnap.data[index];
            return ListTile(
              title: Text(model.name),
              leading: CachedNetworkImage(
                imageUrl: model.logo,
                width: 40.0,
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokemonListView.set(model.id),
                  ),
                );
              },
            );
          },
        );
      },
      future: getSets(),
    );
  }
}
