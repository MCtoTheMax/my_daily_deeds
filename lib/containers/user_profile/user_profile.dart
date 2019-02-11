import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:redux/redux.dart';

class CurrentUserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        if (vm.displayName == null) {
          return Container();
        } else {
          return Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Willkommen',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  '${vm.displayName}',
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class _ViewModel {
  final displayName;
  final profileImgUrl;

  _ViewModel({@required this.displayName, @required this.profileImgUrl});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      // Use the null aware operator here, so that
      // when there isn't a user, it just fails silently
      displayName: store.state.currentUser?.displayName,
      profileImgUrl: store.state.currentUser?.photoUrl,
    );
  }
}
