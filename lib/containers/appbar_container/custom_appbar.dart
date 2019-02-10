import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget{
  final String title;
  final Function onPressedCallback;

  CustomAppbar({@required this.title, this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: onPressedCallback),
    );
  }
}

