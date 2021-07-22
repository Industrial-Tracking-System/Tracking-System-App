import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/providers/Orders.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:flutter/material.dart';

import 'manager_drawer.dart';
import '../../components/myCard.dart';
import 'package:provider/provider.dart';

import 'OrderDetailsScreen.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = "/order-screen";

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // var _isLoading = false;
  // var _isinit = true;
  // @override
  // void didChangeDependencies() {
  //   if (_isinit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<Orders>(context).fetchandSetData().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }
  //   _isinit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final myOrders = Provider.of<Orders>(context).myOrders as List<Order>;
    final customer = Provider.of<Customers>(context);

    return Scaffold(
        drawer: ManagerDrawer(),
        appBar: AppBar(
          title: Text("Orders"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) => MyCard(
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
            id: myOrders[index].id,
            routename: OrderDetailsScreen.routename,
            title: customer
                .findCustomerById(myOrders[index].customer_id)
                .company_name,
            subtitle: myOrders[index].status,
          ),
          itemCount: myOrders.length,
        ));
  }
}
