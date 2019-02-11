import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  final String buttonText;
  final double buttonWidth;
  final Function onPressedCallback;

  GoogleAuthButton(
      {@required this.buttonText, this.onPressedCallback, this.buttonWidth});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressedCallback,
      child: Container(
        width: buttonWidth,
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
