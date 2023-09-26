import 'package:flutter/material.dart';
import 'package:flutter_crud/container_all.dart';
import 'package:flutter_crud/field_form.dart';
import 'package:flutter_crud/user.dart';
import 'package:flutter_crud/user_provider.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  String title = "Create User";

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    int? index;

    if (userProvider.indexUser != null) {
      index = userProvider.indexUser;
      controllerName.text = userProvider.userSelected!.name;
      controllerEmail.text = userProvider.userSelected!.email;
      controllerPassword.text = userProvider.userSelected!.password;

      setState(
        () {
          title = "Edit User";
        },
      );
    }

    GlobalKey<FormState>  key = GlobalKey();

    void save() {

      final isValidate = key.currentState?.validate();

      if(isValidate == false) {
        return;
      }

      key.currentState?.save();


      User user = User(
        name: controllerName.text,
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
      if (index != null) {
        userProvider.users[index] = user;
      } else {
        int usersLength = userProvider.users.length;
        userProvider.users.insert(usersLength, user);
      }
      Navigator.popAndPushNamed(context, "/list");
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
          child: Form(
            key: key,
            child: Column(
              children: [
                FieldForm(
                  label: 'Name',
                  isPassword: false,
                  controller: controllerName,
                  isEmail: false,
                ),
                FieldForm(
                  label: 'Email',
                  isPassword: false,
                  controller: controllerEmail,
                  isEmail: true,
                ),
                FieldForm(
                  label: 'Password',
                  isPassword: true,
                  controller: controllerPassword,
                  isEmail: false,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: save,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Theme.of(context).primaryColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
