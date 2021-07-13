import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: Row(
        children: [
          buildDivider(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "OR",
                style: TextStyle(
                    color: Color(0xFF6F35A5),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              )),
          buildDivider()
        ],
      ),
    );
  }
}

Widget buildDivider() {
  return Expanded(
    child: Divider(
      height: 1.5,
      color: Color(0xFFD9D9D9),
      thickness: 3,
    ),
  );
}
