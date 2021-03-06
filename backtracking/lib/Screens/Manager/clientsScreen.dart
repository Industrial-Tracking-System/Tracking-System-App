import 'package:backtracking/Screens/Manager/ClientDetailsScreen.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:flutter/material.dart';

import 'manager_drawer.dart';
import '../../components/myCard.dart';
import 'package:provider/provider.dart';

class ClientsScreen extends StatefulWidget {
  static const routeName = "/clients-screen";

  @override
  _ClientsScreenState createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Customers>(context, listen: false).fetchandSetData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ManagerDrawer(),
      appBar: AppBar(
        title: Text("Clients"),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Consumer<Customers>(
          builder: (ctx, customerProvider, _) => ListView.builder(
            itemBuilder: (context, index) => MyCard(
              isClient: false,
            
              imageLink:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
              id: customerProvider.myCustoemrs[index].customer_id,
              routename: ClientDetailsScreen.routename,
              title: customerProvider.myCustoemrs[index].company_name,
              subtitle: customerProvider.myCustoemrs[index].customer_name,
            ),
            itemCount: customerProvider.myCustoemrs.length,
          ),
        ),
      ),
    );
  }
}
