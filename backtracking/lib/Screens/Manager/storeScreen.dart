import 'package:backtracking/Screens/Manager/drawer.dart';

import 'package:backtracking/components/myCard.dart';
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
  var _isLoading = false;

  var _isinit = true;

  @override
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Inventories>(context).fetchandSetData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final inventoriesProvider = Provider.of<Inventories>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Inventories"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) => MyCard(
                id: inventoriesProvider.myInventores[index].inventory_id,
                title: inventoriesProvider.myInventores[index].inventory_name,
                subtitle: "Mr " + "zxx",
                routename: StoreDetailsScreen.routename,
                imageLink:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
              ),
              itemCount: inventoriesProvider.myInventores.length,
            ),
    );
  }
}
