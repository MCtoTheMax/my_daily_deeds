import 'package:flutter/material.dart';
import 'package:my_daily_deeds/containers/add_borrow_task_button/add_borrow_task_button_container.dart';

class AddTaskButton extends StatelessWidget {



  void _enterBorrowTaskData(BuildContext context){
    var _personController = TextEditingController();
    var _itemController = TextEditingController();
    var _deadlineController = TextEditingController();

    var _dialog = AlertDialog(
      title: Text('Neue Ausleihe'),
      content: ListView(
        children: <Widget>[
          TextField(
            controller: _personController,
            decoration: InputDecoration(
              hintText: 'An/Von wem',
            ),
          ),
          TextField(
            controller: _itemController,
            decoration: InputDecoration(
              hintText: 'Was',
            ),
          ),
          TextField(
            controller: _deadlineController,
            decoration: InputDecoration(
              hintText: 'Bis wann',
            ),
          ),
          Container(
            child: AddBorrowTaskButtonContainer()
          ),
        ],
      ),
    );

  showDialog(context: context, builder: (context) => _dialog);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => _enterBorrowTaskData(context),
    );
  }
}
