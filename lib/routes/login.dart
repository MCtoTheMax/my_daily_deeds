import 'package:flutter/material.dart';
import 'package:my_daily_deeds/containers/auth_button/auth_button_container.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        leading: Container(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[GoogleAuthButtonContainer()],
        ),
      ),
    );
  }
}
