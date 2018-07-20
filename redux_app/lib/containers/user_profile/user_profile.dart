import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/models/app_state.dart';

class CurrentUserProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, _ViewModel vm) {
        if(vm.displayName == null){
          return new Container();
        } else {
          return new Center(
            child: new Column(
              children: <Widget>[
                new Text("Now sign in:",
                  style: Theme.of(context).textTheme.display1,
                ),
                new Text(vm.displayName,
                  style: Theme.of(context).textTheme.display2,
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
  final String displayName;
  final String profileImageUrl;

  _ViewModel({@required this.displayName, @required this.profileImageUrl});

  static _ViewModel fromStore(Store<AppState> store){
    return new _ViewModel(
      displayName: store.state.currentUser?.displayName,
      profileImageUrl: store.state.currentUser?.photoUrl,
    );
  }
}