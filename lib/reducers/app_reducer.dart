
import 'package:my_daily_deeds/reducers/auth_reducer.dart';
import 'package:my_daily_deeds/models/app_state.dart';

AppState appReducer(AppState state, action){
  return AppState(
    currentUser: authReducer(state.currentUser, action),
  );
}