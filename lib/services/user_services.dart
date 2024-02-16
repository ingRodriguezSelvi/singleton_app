import 'dart:async';

import 'package:singleton_app/models/User.dart';

class _UserServices {

  User? _user;

  final StreamController<User> _userStreamController = StreamController<User>.broadcast();

  User get user => _user!;

  bool get existsUser => _user != null ;

  Stream<User> get userStream => _userStreamController.stream;

  void setUser(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void changeAge(int age) {
    _user!.age = age;
  }

  dispose() {
    _userStreamController.close();
  }

}


final userServices = _UserServices();
