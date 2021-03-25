import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_new/api/pokemon_api.dart';
import 'package:pokemon_new/model/pokemon_model.dart';
import 'package:pokemon_new/model/set_model.dart';
import 'package:pokemon_new/page/home/widget/pokemon_list_view.dart';

class HomePage extends StatefulWidget {
  String _setId;

  HomePage();
  HomePage.set(this._setId);

  @override
  _HomePageState createState() => _HomePageState(_setId);
}

class _HomePageState extends State<HomePage> {
  PokemonModel _pokemonModel;
  String _setId;

  _HomePageState(this._setId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[700],
        title: Text('Pokemon TCG App'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: _drawerBuilder(),
      ),
      body: Center(
        child: this._setId != null
            ? PokemonListView.set(this._setId)
            : PokemonListView(),
      ),
    );
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
                    builder: (context) => HomePage.set(model.id),
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
