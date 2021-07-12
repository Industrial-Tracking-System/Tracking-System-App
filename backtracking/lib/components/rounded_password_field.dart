import 'package:backtracking/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Color(0xFF6F35A5),
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Color(0xFF6F35A5),
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Color(0xFF6F35A5),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
