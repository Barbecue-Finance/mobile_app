class SingletonDS {
  static final SingletonDS _appData = new SingletonDS._internal();
    
  late String token;
  late int userId;

  factory SingletonDS() {
    return _appData;
  }

  SingletonDS._internal(){
    token='nullToken';
    userId=-1;
  }
}

final appData = SingletonDS();
