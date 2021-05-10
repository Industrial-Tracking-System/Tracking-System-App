import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final String name;
  @required
  final int quntity;
  @required
  final DateTime start;
  @required
  final DateTime end;
  @required
  final String id;
  @required
  final String iamgeUrl;

  ProductItem(
      {this.name, this.quntity, this.start, this.id, this.end, this.iamgeUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(iamgeUrl),
          radius: 30,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 5),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Text(
              " From ${DateFormat('hh:mm a').format(start)} To ${DateFormat('hh:mm a').format(end)}",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        trailing: Text(
          "X" + quntity.toString(),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ));
  }
}
// Card(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Name:",
//                 style: Theme.of(context).textTheme.bodyText1,
//               ),
//               Text(
//                 name,
//                 style: Theme.of(context).textTheme.bodyText2,
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Qunatity :",
//                 style: Theme.of(context).textTheme.bodyText1,
//               ),
//               Text(
//                 quntity.toString(),
//                 style: Theme.of(context).textTheme.bodyText2,
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Start:",
//                 style: Theme.of(context).textTheme.bodyText1,
//               ),
//               Text(
//                 "${DateFormat('hh:mm a').format(start)}",
//                 style: Theme.of(context).textTheme.bodyText2,
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "End",
//                 style: Theme.of(context).textTheme.bodyText1,
//               ),
//               Text(
//                 "${DateFormat('hh:mm a').format(end)}",
//                 style: Theme.of(context).textTheme.bodyText2,
//               )
//             ],
//           ),
//         ],
//       ),
//     )
