import 'package:flutter/material.dart';
import 'package:redux_app/pages/home_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_app/models/app_state.dart';
import 'package:redux_app/reducers/app_reducer.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_app/middleware/auth_middleware.dart';

void main() => runApp(new MusicParty());

class MusicParty extends StatelessWidget {

  final String title = "Me Suite";

  // store
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(),
    middleware: []
      ..addAll(createAuthMiddleware())
      ..add( new LoggingMiddleware.printer()),
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
        store: store,
        child: new MaterialApp(
          title: title,
          home: new HomePage(title),
        ),
    );

  }
}
