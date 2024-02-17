
import 'package:flutter/material.dart';
import 'package:singleton_app/models/User.dart';

class UserServices with ChangeNotifier {

  User? _user;

  User get getUser => _user!;
  bool get existsUser => _user != null;

  set setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    _user!.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void addProfession(String profession) {
    _user!.professions.add(profession);
    notifyListeners();
  }

}
