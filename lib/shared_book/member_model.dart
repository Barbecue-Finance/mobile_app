class MemberModel {
  late String _name;
  late int _id;

  String get name => _name;
  set name(String val) {
    _name = val;
  }

  int get id => _id;
  set id(int val) {
    _id = val;
  }

  MemberModel(this._name,this._id);
}