import 'package:flutter/material.dart';
import 'package:flutter_crud/user.dart';

// ignore: must_be_immutable
class UserProvider extends InheritedWidget {
  Widget child;
  List<User> users = [];
  User? userSelected;
  int? indexUser;

  UserProvider({
    required this.child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  bool updateShouldNotify(UserProvider widget) {
    return true;
  }
}
