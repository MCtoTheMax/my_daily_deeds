import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_daily_deeds/actions/auth_actions.dart';
import 'package:my_daily_deeds/containers/auth_button/google_auth_button.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:redux/redux.dart';

class GoogleAuthButtonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        return GoogleAuthButton(
            buttonText: vm.buttonText,
            buttonWidth: vm.buttonWidth,
            onPressedCallback: vm.onPressedCallback);
      },
    );
  }
}

class _ViewModel {
  final String buttonText;
  final double buttonWidth;
  final Function onPressedCallback;

  _ViewModel({
    this.buttonText,
    this.onPressedCallback,
    this.buttonWidth,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    // This is a bit of a more complex _viewModel
    // constructor. As the state updates, it will
    // recreate this _viewModel, and then pass
    // buttonText and the callback down to the button
    // with the appropriate qualities:

    return _ViewModel(
      buttonText: store.state.currentUser != null ? 'Log out' : 'Log in',
      buttonWidth: 200,
      onPressedCallback: () {
        if (store.state.currentUser == null) {
          store.dispatch(LogIn());
        }
      },
    );
  }
}
