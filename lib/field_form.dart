import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool? isForm = true;
  bool isEmail = false;


  FieldForm({
    required this.label,
    required this.isPassword,
    required this.controller,
    this.isForm,
    required this.isEmail,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isForm,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label
      ),
    validator: (value) {
      if (value!.length < 5) {
        return 'Digite pelo menos 5 caracteres';
      }

      if (isEmail && !value.contains("@")) {
        return 'Digite o email corretamente';
      }
      return null;
    },
    );
  }
}