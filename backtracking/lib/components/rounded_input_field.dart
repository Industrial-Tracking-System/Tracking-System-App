import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Color(0xFF6F35A5),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Color(0xFF6F35A5),
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
