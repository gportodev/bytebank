import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Editor({
    this.controller,
    this.label,
    this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 22),
        decoration:
            InputDecoration(icon: Icon(icon), labelText: label, hintText: hint),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
