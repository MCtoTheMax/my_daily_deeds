import 'package:my_daily_deeds/actions/firestore_actions.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:my_daily_deeds/models/tasks.dart';
import 'package:my_daily_deeds/services/firebase_firestore_service.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createBorrowTasksMiddleware() {
  final initApp = _createInitAppActionMiddleware();
  final connectToDataSource = _createConnectToDataSourceAction();
  final addBorrowTask = _createAddBorrowTaskMiddleware();
  final deleteBorrowTask = _createDeleteBorrowTaskMiddleware();
  final updateBorrowTask = _createUpdateBorrowTaskMiddleware();

  List<Middleware<AppState>> firestoreMiddleware = [
    TypedMiddleware<AppState, InitAppAction>(initApp),
    TypedMiddleware<AppState, ConnectToDataSourceAction>(connectToDataSource),
    TypedMiddleware<AppState, AddBorrowTaskAction>(addBorrowTask),
    TypedMiddleware<AppState, DeleteBorrowTaskAction>(deleteBorrowTask),
    TypedMiddleware<AppState, UpdateBorrowTaskAction>(updateBorrowTask),
  ];

  return firestoreMiddleware;
}

Middleware<AppState> _createInitAppActionMiddleware() {}

Middleware<AppState> _createConnectToDataSourceAction() {}

Middleware<AppState> _createAddBorrowTaskMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    FirebaseFirestoreService db = FirebaseFirestoreService();
    if (action is AddBorrowTaskAction) {
      BorrowTask borrowTask = action.borrowTask;
      await db.createBorrowTask(
          borrowTask.person, borrowTask.item, borrowTask.deadline);
    }
  };
}

Middleware<AppState> _createDeleteBorrowTaskMiddleware() {}

Middleware<AppState> _createUpdateBorrowTaskMiddleware() {}
