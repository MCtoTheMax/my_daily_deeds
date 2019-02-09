import 'package:flutter/material.dart';
import 'package:my_daily_deeds/containers/auth_button/auth_button_container.dart';
import 'package:my_daily_deeds/containers/user_profile/user_profile.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          leading: Container(),
          actions: <Widget>[
            GoogleAuthButtonContainer(),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CurrentUserProfile(),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}));
  }
}
