import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerAll extends StatelessWidget {
  Widget child;
  ContainerAll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(235, 229, 229, 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
