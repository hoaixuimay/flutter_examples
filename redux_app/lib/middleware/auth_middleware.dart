import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/models/app_state.dart';
import 'package:redux_app/actions/auth_actions.dart';

List<Middleware<AppState>> createAuthMiddleware() {
  final logIn = _createLogInMiddleware();
  final logOut = _createLogOutMiddleware();
  return [
    new TypedMiddleware<AppState, LogIn>(logIn),
    new TypedMiddleware<AppState, LogOut>(logOut),
  ];
}
Middleware<AppState> _createLogInMiddleware(){
  return (Store store, action, NextDispatcher next) async {
    FirebaseUser user;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignIn _googleSignIn = new GoogleSignIn();

    // action
    if(action is LogIn){
      try {
        GoogleSignInAccount googleUser = await _googleSignIn.signIn();
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        user = await _auth.signInWithGoogle(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        store.dispatch(new LogInSuccessful(user: user));

      } catch(error){

        store.dispatch(new LogInFail(error: error));
        
      }
    }

    next(action);
  };
}
Middleware<AppState> _createLogOutMiddleware(){
  return (Store store, action, NextDispatcher next) async {
    
    final _auth = FirebaseAuth.instance;
    try{
      await _auth.signOut();

      print('logging out...');

      store.dispatch(new LogOutSuccessful());

    } catch(error){
      print(error);
    }
    
    next(action);
  };
}