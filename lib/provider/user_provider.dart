import 'package:flutter/material.dart';
import 'package:travel_bud/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    name: '',
    mobileNo: 0,
    email: '',
    password: '',
    type: '',
    id: '',
    token: '',
  );

  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }
}
