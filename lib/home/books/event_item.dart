class EventItem {
  late String _name;

  String get name => _name;
  set name(String val) {
    _name = val;
  }

  EventItem(this._name);
}
