import 'package:flutter/material.dart';

class AddBorrowTaskButton extends StatelessWidget {
  final Function onPressedCallback;

  AddBorrowTaskButton({this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressedCallback,
      child: Icon(Icons.ac_unit),
    );
  }
}
