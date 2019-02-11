import 'package:my_daily_deeds/actions/task_actions.dart';
import 'package:redux/redux.dart';

final borrowTaskInputReducer = combineReducers<Map<String, dynamic>>([
  TypedReducer<Map<String, dynamic>, GetBorrowTaskInput>(_getBorrowTaskInput),
]);

Map<String, dynamic> _getBorrowTaskInput(
    Map<String, dynamic> borrowTaskInput, GetBorrowTaskInput action) {
  return action.borrowTaskInput;
}
