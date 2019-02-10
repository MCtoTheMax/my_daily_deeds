import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_daily_deeds/models/tasks.dart';
import 'package:my_daily_deeds/services/firebase_firestore_service.dart';

class AppState{

  final FirebaseUser currentUser;
  final List<BorrowTask> borrowTasks;

  FirebaseFirestoreService db = FirebaseFirestoreService();
  StreamSubscription<QuerySnapshot> borrowTaskSub;

  AppState({
    this.currentUser,
    this.borrowTasks = const [],
  });



  AppState copyWith(){
    return AppState(
      currentUser: currentUser ?? this.currentUser,
      borrowTasks: borrowTasks ?? this.borrowTasks,
    );
  }

  String toString(){
    return 'AppState(currentUser: $currentUser)';
  }
}

