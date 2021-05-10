import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Module/products.dart';
import '../Module/Product_item.dart';
import '../Module/product.dart';
import '../Screens/drawer.dart';

class ProductionScreen extends StatelessWidget {
  static const routeName = "productionScreen";
  @override
  Widget build(BuildContext context) {
    final myProductsList = Provider.of<Products>(context, listen: false);
    final myProducts = myProductsList.myProducts as List<Product>;
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: Colors.purple[400],
      appBar: AppBar(
        title: Text("Production"),
        actions: [],
      ),
      body: LayoutBuilder(
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      margin: EdgeInsets.only(top: 40),
                      alignment: Alignment.center,
                      child: Text(myProductsList.totalQuntity.toString()),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
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
                    return ProductItem(
                      id: myProducts[index].id,
                      start: myProducts[index].start,
                      quntity: myProducts[index].quntity,
                      end: myProducts[index].end,
                      name: myProducts[index].name,
                      iamgeUrl: myProducts[index].imageUrl,
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
