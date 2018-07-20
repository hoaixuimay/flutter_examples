import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/actions/auth_actions.dart';

final authReducer = combineReducers<FirebaseUser>([
  new TypedReducer<FirebaseUser, LogInSuccessful>(loginReducer),
  new TypedReducer<FirebaseUser, LogOutSuccessful>(logoutReducer),
]);

FirebaseUser loginReducer(FirebaseUser user, action) {
  return action.user;
}

Null logoutReducer(FirebaseUser user, action) {
  return null;
}