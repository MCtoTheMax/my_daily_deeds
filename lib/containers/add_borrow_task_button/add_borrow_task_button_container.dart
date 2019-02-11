import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_daily_deeds/actions/firestore_actions.dart';
import 'package:my_daily_deeds/containers/add_borrow_task_button/add_borrow_task_button.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:my_daily_deeds/models/tasks.dart';
import 'package:redux/redux.dart';

class AddBorrowTaskButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return AddBorrowTaskButton(
          onPressedCallback: vm.onPressedCallback,
        );
      },
    );
  }
}

class _ViewModel {
  final onPressedCallback;

  _ViewModel({this.onPressedCallback});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(onPressedCallback: () {
      BorrowTask borrowTask =
          BorrowTask(null, 'testperson', 'testitem', DateTime.utc(2019, 2, 15));

      store.dispatch(AddBorrowTaskAction(borrowTask));
    });
  }
}
