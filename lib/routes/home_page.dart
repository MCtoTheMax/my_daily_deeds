import 'package:flutter/material.dart';
import 'package:my_daily_deeds/containers/appbar_container/appbar_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarContainer(),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}));
  }
}
