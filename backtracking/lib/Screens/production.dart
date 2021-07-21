import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../Widgets/Product_item.dart';
import '../Modules/product.dart';
import '../Screens/drawer.dart';

class ProductionScreen extends StatefulWidget {
  static const routeName = "productionScreen";

  @override
  _ProductionScreenState createState() => _ProductionScreenState();
}

class _ProductionScreenState extends State<ProductionScreen> {
  var _isLoading = false;
  var _isinit = true;
  @override
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fetchandSetData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isinit = false;
    super.didChangeDependencies();
  }

  // Future<void> _refreshProducts(BuildContext context) async {
  //   await Provider.of<Products>(context, listen: false).fetchandSetData();
  // }

  @override
  Widget build(BuildContext context) {
    final myProductsList = Provider.of<Products>(context);
    final myProducts = myProductsList.myProducts as List<Product>;
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Production"),
        actions: [],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            )
          : LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text("Total",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            margin: EdgeInsets.only(top: 40),
                            alignment: Alignment.center,
                            child: Text(myProductsList.totalQuntity.toString()),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 20),
                      width: MediaQuery.of(context).size.width,
                      height: constraints.maxHeight * 0.776,
                      child: ListView.builder(
                        itemCount: myProducts.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ProductItem(
                                id: myProducts[index].id,
                                start: myProducts[index].start,
                                quntity: myProducts[index].quntity,
                                name: myProducts[index].name,
                                iamgeUrl: myProducts[index].imageUrl,
                              ),
                              Divider(
                                height: 1,
                                color: Colors.black12,
                                thickness: 2,
                              )
                            ],
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(75))),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
