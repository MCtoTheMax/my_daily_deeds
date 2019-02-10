import 'package:my_daily_deeds/actions/firestore_actions.dart';
import 'package:my_daily_deeds/models/tasks.dart';
import 'package:redux/redux.dart';

final borrowTaskReducer = combineReducers<List<BorrowTask>>([
  TypedReducer<List<BorrowTask>, LoadBorrowTaskAction>(_setLoadedBorrowTasks),
  TypedReducer<List<BorrowTask>, DeleteBorrowTaskAction>(_deleteBorrowTask),
]);

List<BorrowTask> _setLoadedBorrowTasks(
    List<BorrowTask> borrowTasks, LoadBorrowTaskAction action) {
  return action.borrowTasks;
}

List<BorrowTask> _deleteBorrowTask(
    List<BorrowTask> borrowTasks, DeleteBorrowTaskAction action) {
  return borrowTasks..removeWhere((borrowTask) => borrowTask.id == action.id);
}
