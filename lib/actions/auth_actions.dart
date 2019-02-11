import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class LogIn {}

class LogInSuccessful {
  final FirebaseUser user;

  LogInSuccessful({@required this.user});

  String toString() {
    return 'Login{user: $user}';
  }
}

class LogInFailed {
  final dynamic error;

  LogInFailed(this.error);

  String toString() {
    return 'Login{There was a login-error: $error}';
  }
}

class LogOut {}

class LogOutSuccessful {
  LogOutSuccessful();

  String toString() {
    return 'Logout{user: null}';
  }
}
