// Borrow TASK
class BorrowTask {
  String _id;
  String _person;
  String _item;
  DateTime _deadline;

  BorrowTask(this._id, this._person, this._item, this._deadline);

  BorrowTask.map(dynamic obj) {
    this._id = obj['id'];
    this._person = obj['person'];
    this._item = obj['item'];
    this._deadline = obj['deadline'];
  }

  get id => _id;

  get person => _person;

  get item => _item;

  get deadline => _deadline;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['person'] = _person;
    map['item'] = _item;
    map['deadline'] = _deadline;
    return map;
  }

  BorrowTask.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._person = map['person'];
    this._item = map['item'];
    this._deadline = map['deadline'];
  }
}
