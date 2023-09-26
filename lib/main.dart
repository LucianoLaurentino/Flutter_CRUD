import 'package:flutter/material.dart';
import 'package:flutter_crud/user_form.dart';
import 'package:flutter_crud/user_list.dart';
import 'package:flutter_crud/user_provider.dart';
import 'package:flutter_crud/user_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UserProvider(
      child: MaterialApp(
        title: 'CRUD APP',
        home: const UserForm(),
        routes: {
          "/create": (_) => const UserForm(),
          "/list": (_) => const UserList(),
          "/view": (_) =>  UserView(),

        },
      ),
    );
  }
}
