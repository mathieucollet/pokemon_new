import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_new/api/pokemon_api.dart';
import 'package:pokemon_new/model/set_model.dart';
import 'package:pokemon_new/page/home/home_page.dart';
import 'package:pokemon_new/style/colors.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<SetModel>> projectSnap) {
        if (projectSnap.hasData == false) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        return ListView.builder(
          itemCount: projectSnap.data.length,
          itemBuilder: (context, index) {
            SetModel set = projectSnap.data[index];
            return ListTile(
              tileColor: white,
              title: Text(set.name),
              leading: CachedNetworkImage(
                imageUrl: set.logo,
                width: 40.0,
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: grey,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(set: set),
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
