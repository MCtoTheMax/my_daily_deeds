// Recall that middleware is simply functions.
//
// These functions more or less intercept actions -- pausing
// the Redux cycle while your app does some work.
//
// If you have multiple middleware functions that are related
// to a single piece of state, you can use a method like this
// which will return multiple functions that you can add
// to your store.


import 'package:redux/redux.dart';
import 'package:my_daily_deeds/actions/auth_actions.dart';
import 'package:my_daily_deeds/models/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

List<Middleware<AppState>> createAuthMiddleware(){
  final logIn = _createLogInMiddleware();
  final logOut = _createLogOutMiddleware();

  List<Middleware<AppState>> authMiddleware = [
    TypedMiddleware<AppState, LogIn>(logIn),
    TypedMiddleware<AppState, LogOut>(logOut)
  ];

  return authMiddleware;
}

// two methods, both of which
// return a Middleware typed function.

// These functions will always take
// your store,
// the action thats been dispatched
// and the a special function called next.


Middleware<AppState> _createLogInMiddleware(){
  return(Store store, action, NextDispatcher next)async{

    // YOUR LOGIC HERE
    FirebaseUser user;

    // Firebase 'instances' are temporary instances which give
    // you access to your FirebaseUser. This includes
    // some tokens we need to sign in.
    final FirebaseAuth _auth = FirebaseAuth.instance;

    // GoogleSignIn is a specific sign in class.
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    // Actions are classes, so you can Typecheck them
    if(action is LogIn){
      try{
        // Try to sign in the user.
        // This method will either log in a user that your Firebase
        // is aware of, or it will prompt the user to log in
        // if its the first time.
        print('test');
        GoogleSignInAccount googleUser = await _googleSignIn.signIn();

        GoogleSignInAuthentication googleAuth = await googleUser.authentication;


        AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        // After checking for authentication,
        // We wil actually sign in the user
        // using the token that firebase provides.

        user = await _auth.signInWithCredential(credential);

//       CHANGE FOR NEWER FIREBASE VERSION <0.8.2
//        user = await _auth.signInWithGoogle(
//          accessToken: googleAuth.accessToken,
//          idToken: googleAuth.idToken,
//        );

        print('User logged in: ${user.displayName}');

        // We're going to dispatch a new action if we logged in,
        //
        // We also continue the current cycle below by calling next(action).

        store.dispatch(LogInSuccessful(user: user));

      }catch(error){
        store.dispatch(LogInFailed(error));
      }
    }

    // After you do whatever logic you need to do,
    // call this Redux built-in method,
    // It continues the redux cycle.

    next(action);
  };
}

Middleware<AppState> _createLogOutMiddleware(){
  return(Store store, action, NextDispatcher next)async{

    // temporary instance
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try{
      await _auth.signOut();
      print('Logging out');
      store.dispatch(LogOutSuccessful);
    }catch(error){
      print('Error while logging out: $error');
    }

    // YOUR LOGIC HERE

    next(action);
  };
}