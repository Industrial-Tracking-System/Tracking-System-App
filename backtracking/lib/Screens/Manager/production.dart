import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';
import '../../Widgets/Product_item.dart';
import 'manager_drawer.dart';

class ProductionScreen extends StatefulWidget {
  static const routeName = "productionScreen";

  @override
  _ProductionScreenState createState() => _ProductionScreenState();
}

class _ProductionScreenState extends State<ProductionScreen> {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchandSetData();
  }

  @override
  Widget build(BuildContext context) {
    // final myProductsList = Provider.of<Products>(context, listen: false);
    // final myProducts = myProductsList.myProducts as List<Product>;
    return Scaffold(
      drawer: ManagerDrawer(),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Production"),
        actions: [],
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Consumer<Products>(
            builder: (ctx, productProvider, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: const Text("Total",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        margin: const EdgeInsets.only(top: 40),
                        alignment: Alignment.center,
                        child: Text(productProvider.totalQuntity.toString()),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RefreshIndicator(
                  onRefresh: () => _refreshProducts(context),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    width: MediaQuery.of(context).size.width,
                    height: constraints.maxHeight * 0.776,
                    child: ListView.builder(
                      itemCount: productProvider.myProducts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ProductItem(
                              id: productProvider.myProducts[index].id,
                              start: productProvider.myProducts[index].start,
                              quntity:
                                  productProvider.myProducts[index].quntity,
                              name: productProvider.myProducts[index].name,
                              iamgeUrl:
                                  productProvider.myProducts[index].imageUrl,
                            ),
                            const Divider(
                              height: 1,
                              color: Colors.black12,
                              thickness: 2,
                            )
                          ],
                        );
                      },
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(75))),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
