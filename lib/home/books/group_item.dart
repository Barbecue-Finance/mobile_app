import 'package:shashliki/auth/api_auth.dart';
import 'package:shashliki/home/books/api_books.dart';

class GroupItem {
  late String _name;
  late int _id;
  late List<GroupUserDto> _users;

  String get name => _name;
  set name(String val) {
    _name = val;
  }

  int get id => _id;
  set id(int val) {
    _id = val;
  }

  List<GroupUserDto> get users => _users;
  set users(List<GroupUserDto> val) {
    _users = val;
  }



  GroupItem(this._name,this._id,this._users);
}