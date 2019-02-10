
import 'package:my_daily_deeds/reducers/auth_reducer.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:my_daily_deeds/reducers/borrow_task_reducer.dart';

AppState appReducer(AppState state, action){
  return AppState(
    currentUser: authReducer(state.currentUser, action),
    borrowTasks: borrowTaskReducer(state.borrowTasks, action),
  );
}