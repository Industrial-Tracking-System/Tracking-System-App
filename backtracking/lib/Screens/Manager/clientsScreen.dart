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
  var _isLoading = false;

  var _isinit = true;

  @override
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Customers>(context).fetchandSetData().then((_) {
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
    final customerProvider = Provider.of<Customers>(context);

    return Scaffold(
        drawer: ManagerDrawer(),
        appBar: AppBar(
          title: Text("Clients"),
        ),
        backgroundColor: Colors.white,
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
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
