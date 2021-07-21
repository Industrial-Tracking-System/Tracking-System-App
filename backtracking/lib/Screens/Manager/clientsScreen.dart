import 'package:backtracking/Screens/Manager/ClientDetailsScreen.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';
import '../../components/myCard.dart';
import 'package:provider/provider.dart';


class ClientsScreen extends StatelessWidget {
  static const routeName = "/clients-screen";

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<Customers>(context);

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Clients"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) => MyCard(
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
            id: customerProvider.myCustoemrs[index].customer_id,
            routename: ClientDetailsScreen.routename,
            title: customerProvider.myCustoemrs[index].company_name,
            subtitle: customerProvider.myCustoemrs[index].customer_name,
          ),
          itemCount: customerProvider.myCustoemrs.length,
        ));
  }
}
