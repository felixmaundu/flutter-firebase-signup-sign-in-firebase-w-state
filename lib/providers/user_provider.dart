import 'package:flutter/widgets.dart';
import 'package:project10/models/user.dart';
import 'package:project10/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    //function in user.dart
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
