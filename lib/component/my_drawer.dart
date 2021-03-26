import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_new/api/set_api.dart';
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
          itemCount: projectSnap.data.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }
            SetModel set = projectSnap.data[index - 1];
            return ListTile(
              tileColor: white,
              title: Text(set.name),
              leading: CachedNetworkImage(
                imageUrl: set.logo,
                width: 50.0,
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
