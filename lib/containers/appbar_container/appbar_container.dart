import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_daily_deeds/actions/auth_actions.dart';
import 'package:my_daily_deeds/containers/appbar_container/custom_appbar.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:redux/redux.dart';

class AppbarContainer extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return CustomAppbar(
          title: vm.title,
          onPressedCallback: vm.onPressedCallback,
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}

class _ViewModel {
  final String title;
  final Function onPressedCallback;

  _ViewModel({this.title, this.onPressedCallback});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        title: store.state.currentUser != null
            ? 'Wilkommen ${store.state.currentUser.displayName}'
            : 'Login',
        onPressedCallback: () {
          if (store.state.currentUser != null) {
            store.dispatch(LogOut());
          }
        });
  }
}
