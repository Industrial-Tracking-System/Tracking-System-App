import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String id;
  final String title;
  final String subtitle;
  final String routename;
  final String imageLink;

  MyCard({
    this.id,
    this.title,
    this.subtitle,
    this.routename,
    this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routename, arguments: id);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        elevation: 10,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(imageLink),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 15),
          ),
          trailing: Icon(
            Icons.arrow_right,
            size: 35,
          ),
        ),
      ),
    );
  }
}
