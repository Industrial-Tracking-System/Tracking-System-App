import 'package:backtracking/Screens/Manager/manager_drawer.dart';

import 'package:backtracking/components/myCard.dart';
import 'package:backtracking/providers/Employees.dart';
import 'package:backtracking/providers/inventories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'StoreDetailsScreen.dart';

class StoreScreen extends StatefulWidget {
  static const routeName = "/store-Screen";

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Inventories>(context, listen: false).fetchandSetData();
  }

  @override
  Widget build(BuildContext context) {
    Employees employee = Provider.of<Employees>(context, listen: false);

    return Scaffold(
      drawer: ManagerDrawer(),
      appBar: AppBar(
        title: Text("Inventories"),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Consumer<Inventories>(
          builder: (ctx, inventoriesProvider, _) => ListView.builder(
            itemBuilder: (context, index) => MyCard(
              id: inventoriesProvider.myInventores[index].inventory_id,
              title: inventoriesProvider.myInventores[index].inventory_name,
              subtitle: employee
                  .findEmployeeByid(
                      inventoriesProvider.myInventores[index].empolyee_id)
                  .name,
              routename: StoreDetailsScreen.routename,
              imageLink:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
            ),
            itemCount: inventoriesProvider.myInventores.length,
          ),
        ),
      ),
    );
  }
}
