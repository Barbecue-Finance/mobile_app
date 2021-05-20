class UserAction {
  late String _type;
  late String _productName;
  late int _summ;
  late int _ownerId; 

  String get type => _type;
  set type(String val) {
    _type = val;
  }

  String get productName => _productName;
  set productName(String val) {
    _productName = val;
  }

  int get summ => _summ;
  set summ(int val) {
    _summ = val;
  }

  int get ownerId => _ownerId;
  set ownerId(int val) {
    _ownerId = val;
  }

  UserAction(this._ownerId,this._type,this._summ);
}
