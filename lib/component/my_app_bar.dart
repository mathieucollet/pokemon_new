import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_new/model/set_model.dart';
import 'package:pokemon_new/page/home/home_page.dart';
import 'package:pokemon_new/style/colors.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  SetModel set;
  SetModel goBackToSet;
  bool goBackToMain;
  MyAppBar({Key key, this.goBackToSet, this.set, this.goBackToMain})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: grey,
      title: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(
              this.widget.set != null ? this.widget.set.name : 'Pokemon TCG',
              style: TextStyle(
                color: red,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          if (this.widget.set != null)
            CachedNetworkImage(
              imageUrl: this.widget.set.symbol,
              width: 40.0,
            )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            (this.widget.goBackToSet != null ||
                    this.widget.goBackToMain == true)
                ? Icons.arrow_back
                : Icons.home,
            color: white,
          ),
          onPressed: () {
            if (this.widget.goBackToSet != null &&
                this.widget.goBackToMain == false) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(set: this.widget.goBackToSet),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
