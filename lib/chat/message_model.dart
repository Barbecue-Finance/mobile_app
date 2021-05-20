class MessageModel {
  late String _text;
  late String _time;
  late int _userId;

  String get text => _text;
  set text(String val) {
    _text = val;
  }

  String get time => _time;
  set time(String val) {
    _time = val;
  }

  int get userId => _userId;
  set userId(int val) {
    _userId = val;
  }

  MessageModel(this._userId,this._time,this._text);

}