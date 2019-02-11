import 'package:flutter/material.dart';
import 'package:my_daily_deeds/containers/appbar/appbar_container.dart';
import 'package:my_daily_deeds/main.dart';

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
        floatingActionButton: FloatingActionButton(onPressed: () {
          navigatorKey.currentState.pushNamed('/borrowTask');
        }));
  }
}
