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
  @override
  Widget build(BuildContext context) {
    Future<void> _refreshProducts(BuildContext context) async {
      await Provider.of<Orders>(context, listen: false).fetchandSetData();
    }
    final customer = Provider.of<Customers>(context, listen: false);

    return Scaffold(
      drawer: ManagerDrawer(),
      appBar: AppBar(
        title: Text("Orders"),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _refreshProducts(context),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProducts(context),
                    child: Consumer<Orders>(
                      builder: (ctx, orderProvider, _) => ListView.builder(
                        itemBuilder: (context, index) => MyCard(
                          imageLink:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
                          id: orderProvider.myOrders[index].id,
                          routename: OrderDetailsScreen.routename,
                          title: customer
                              .findCustomerById(orderProvider.myOrders[index].customer_id)
                              .company_name,
                          subtitle: orderProvider.myOrders[index].status,
                        ),
                        itemCount: orderProvider.myOrders.length,
                      ),
                    ),
                  ),
      ),
    );
  }
}
