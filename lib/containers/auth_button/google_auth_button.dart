import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  final String buttonText;
  final Function onPressedCallback;

  GoogleAuthButton({@required this.buttonText, this.onPressedCallback});


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressedCallback,
      child: Container(
        width: 230,
        height: 50,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
