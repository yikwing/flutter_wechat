import 'package:flutter/material.dart';

class BasicAppbar extends StatefulWidget {
  final String title;

  BasicAppbar({Key key, this.title}) : super(key: key);

  _BasicAppbarState createState() => _BasicAppbarState();
}

class _BasicAppbarState extends State<BasicAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          onPressed: () {},
        ),
      ],
      elevation: 0.0,
    );
  }
}
