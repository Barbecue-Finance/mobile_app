class OperationModel {
  late double _amount;
  late String _type;
  late String _comment;
  late String _dateTime;
  late int _purseId;

  double get amount => _amount;
  set amount(double val) {
    _amount = val;
  }

  String get type => _type;
  set type(String val) {
    _type = val;
  }

  String get comment => _comment;
  set comment(String val) {
    _comment = val;
  }

  String get dateTime => _dateTime;
  set dateTime(String val) {
    _dateTime = val;
  }

  int get purseId => _purseId;
  set purseId(int val) {
    _purseId = val;
  }

  OperationModel(this._amount,this._type, this._comment, this._dateTime, this._purseId);
}
