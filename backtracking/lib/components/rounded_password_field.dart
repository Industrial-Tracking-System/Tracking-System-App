import 'package:flutter/material.dart';

import '../components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.controller,
    String hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Color(0xFF6F35A5),
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color(0xFF6F35A5),
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: Color(0xFF6F35A5),
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
