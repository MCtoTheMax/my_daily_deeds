import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_daily_deeds/middleware/auth_middleware.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:my_daily_deeds/routes/home_page.dart';
import 'package:redux/redux.dart';
import 'package:my_daily_deeds/reducers/app_reducer.dart';
import 'package:redux_logging/redux_logging.dart';


void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  final title = 'MyDailyDeeds';

  // Store for holding the AppState
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),

    // Middleware has to be a List of MiddleWare functions
    // This syntax will allow you to add any middleware
    // regardless of wether it's already a list of middleware
    // or it's just a function:
    middleware: []
      ..addAll(createAuthMiddleware())
      ..add(LoggingMiddleware.printer())

  );

  @override
  Widget build(BuildContext context){
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: title,
        home: HomePage(),
      ),
    );
  }
}
