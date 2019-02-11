import 'package:my_daily_deeds/models/tasks.dart';

class AddBorrowTask {}

class LoadBorrowTaskAction {
  final List<BorrowTask> borrowTasks;

  LoadBorrowTaskAction(this.borrowTasks);

  @override
  String toString() {
    return 'LoadBorrowTaskAction{borrowTasks: $borrowTasks}';
  }
}

class UpdateBorrowTaskAction {
  final String id;
  final BorrowTask updateBorrowTask;

  UpdateBorrowTaskAction(this.id, this.updateBorrowTask);

  @override
  String toString() {
    return 'UpdateBorrowTaskAction{id: $id, updateBorrowTask: $updateBorrowTask}';
  }
}

class DeleteBorrowTaskAction {
  final String id;

  DeleteBorrowTaskAction(this.id);

  @override
  String toString() {
    return 'DeleteBorrowTaskAction{id: $id}';
  }
}

class AddBorrowTaskAction {
  final BorrowTask borrowTask;

  AddBorrowTaskAction(this.borrowTask);

  @override
  String toString() {
    return 'AddBorrowTaskAction{borrowTask: $borrowTask}';
  }
}

class InitAppAction {
  @override
  String toString() {
    return 'InitAppAction{}';
  }
}

class ConnectToDataSourceAction {
  @override
  String toString() {
    return 'ConnectToDataSourceAction{}';
  }
}
