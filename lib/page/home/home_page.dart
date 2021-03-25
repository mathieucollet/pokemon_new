import 'package:flutter/material.dart';
import 'package:pokemon_new/component/my_scaffold.dart';
import 'package:pokemon_new/model/set_model.dart';
import 'package:pokemon_new/page/home/widget/pokemon_list_view.dart';

class HomePage extends StatefulWidget {
  SetModel set;

  HomePage({this.set});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var body = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: this.widget.set != null
            ? PokemonListView(setId: this.widget.set.id)
            : PokemonListView(),
      ),
    );
    return MyScaffold(body: body, set: this.widget.set);
  }
}
