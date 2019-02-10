import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_daily_deeds/models/tasks.dart';

final CollectionReference borrowTaskCollection = Firestore.instance.collection('borrowTasks');

class FirebaseFirestoreService {


  // ADD TO ENSURE THAT THE APP RUNS IN THE FUTURE, DOESN'T SEEM TO WORK ATM

  //  FirebaseFirestore firestore = FirebaseFirestore.getInstance();
  //  FirebaseFirestoreSettings settings = new FirebaseFirestoreSettings.Builder()
  //      .setTimestampsInSnapshotsEnabled(true)
  //      .build();
  //  firestore.setFirestoreSettings(settings);

  static final FirebaseFirestoreService _instance = new FirebaseFirestoreService.internal();

  factory FirebaseFirestoreService() => _instance;

  FirebaseFirestoreService.internal();


  // CREATE BORROW TASK
  Future<BorrowTask> createBorrowTask(String person, String item, DateTime deadline) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(borrowTaskCollection.document());

      final BorrowTask borrowTask = new BorrowTask(ds.documentID, person, item, deadline);
      final Map<String, dynamic> data = borrowTask.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return BorrowTask.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  // GET ALL BORROW TASKS
  Stream<QuerySnapshot> getBorrowTaskList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = borrowTaskCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  // UPDATE BORROW TASK
  Future<dynamic> updateBorrowTask(BorrowTask borrowTask) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(borrowTaskCollection.document(borrowTask.id));

      await tx.update(ds.reference, borrowTask.toMap());
      return {'updated': true};
    };

    return Firestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  // DELETE BORROW TASK
  Future<dynamic> deleteBorrowTask(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(borrowTaskCollection.document(id));

      await tx.delete(ds.reference);
      return {'deleted': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }
}