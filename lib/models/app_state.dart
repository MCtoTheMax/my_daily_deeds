import 'package:firebase_auth/firebase_auth.dart';

class AppState{

  final FirebaseUser currentUser;

  AppState({this.currentUser});

  AppState copyWith(){
    return AppState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

  String toString(){
    return 'AppState(currentUser: $currentUser)';
  }
}