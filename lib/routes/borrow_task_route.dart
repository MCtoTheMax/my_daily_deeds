import 'package:flutter/material.dart';
import 'package:my_daily_deeds/containers/add_borrow_task_button/add_borrow_task_button_container.dart';
import 'package:my_daily_deeds/containers/appbar/appbar_container.dart';

class BorrowTaskRoute extends StatelessWidget  {

  var _personController = TextEditingController();
  var _itemController = TextEditingController();
  var _deadlineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarContainer(
        title: 'Neue Ausleihe',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _personController,
              decoration: InputDecoration(
                hintText: 'Person'
              ),
            ),
            TextField(
              controller: _itemController,
              decoration: InputDecoration(
                  hintText: 'Item'
              ),
            ),
            TextField(
              controller: _deadlineController,
              decoration: InputDecoration(
                  hintText: 'Deadline'
              ),
            ),
            MyInherited(
              data: {
                'person': _personController,
                'item': _itemController,
                'deadline': _deadlineController,
              },
              child: AddBorrowTaskButtonContainer(),
            )
          ],
        ),
      ),
    );
  }
}

class MyInherited extends InheritedWidget {
  MyInherited({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  final Map<String, dynamic> data;

  @override
  bool updateShouldNotify(MyInherited oldWidget) {
    return true;
  }
}