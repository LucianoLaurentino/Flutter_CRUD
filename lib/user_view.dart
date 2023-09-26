import 'package:flutter/material.dart';
import 'package:flutter_crud/container_all.dart';
import 'package:flutter_crud/field_form.dart';
import 'package:flutter_crud/user_provider.dart';

class UserView extends StatelessWidget {
  UserView({super.key});

  final String title = "Show User";

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            margin: const EdgeInsets.all(8),
            child: TextButton(
              child: const Text('User List'),
              onPressed: () {
                Navigator.popAndPushNamed(context, "/list");
              },
            ),
          ),
        ],
      ),
      body: ContainerAll(
        child: Center(
          child: Column(
            children: [
              FieldForm(
                label: 'Name',
                isPassword: false,
                controller: controllerName,
                isForm: false,
                isEmail: false,
              ),
              FieldForm(
                label: 'Email',
                isPassword: false,
                controller: controllerEmail,
                isForm: false,
                isEmail: false,
              ),
              FieldForm(
                label: 'Password',
                isPassword: false,
                controller: controllerPassword,
                isForm: false,
                isEmail: false,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/create");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text('Edit'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      userProvider.indexUser = null;
                      userProvider.users.removeAt(index!);
                      Navigator.popAndPushNamed(context, "/create");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text('Delete'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
