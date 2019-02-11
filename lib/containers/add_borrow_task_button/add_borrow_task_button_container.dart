import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_daily_deeds/actions/firestore_actions.dart';
import 'package:my_daily_deeds/containers/add_borrow_task_button/add_borrow_task_button.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:my_daily_deeds/models/tasks.dart';
import 'package:redux/redux.dart';

class AddBorrowTaskButtonContainer extends StatelessWidget {
  var personController = TextEditingController();
  var itemController = TextEditingController();
  var deadlineController = TextEditingController();

  AddBorrowTaskButtonContainer(
      this.personController, this.itemController, this.deadlineController);

  BorrowTask _getBorrowTask() {
    final _person = personController.text;
    final _item = itemController.text;
    final _deadline = deadlineController.text;
    BorrowTask _borrowTask = BorrowTask(null, _person, _item, _deadline);
    return _borrowTask;
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(
      builder: (context, Store<AppState> store) {
        return AddBorrowTaskButton(
          onPressedCallback: () =>
              store.dispatch(AddBorrowTaskAction(_getBorrowTask())),
        );
      },
    );
  }
}
