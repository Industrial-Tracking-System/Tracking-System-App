import 'package:backtracking/Screens/Welcome/components/Button.dart';

import 'package:backtracking/providers/inventories.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class StoreDetailsScreen extends StatelessWidget {
  static const routename = "/Store-Details-Screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final inventoryId = ModalRoute.of(context).settings.arguments as String;
    final inventory =
        Provider.of<Inventories>(context).findInventoryByid(inventoryId);

    return Scaffold(
      appBar: AppBar(
        title: Text(inventory.inventory_name + " Store"),
      ),
      body: Container(
        height: size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        child: Stack(
          children: [
            Container(
              height: (size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.4,
              width: double.infinity,
              color: Colors.white,
              child: Image.asset(
                "assets/icons/stores_icon.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: (size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.27,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  topRight: Radius.circular(75),
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Inventory Name: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            inventory.inventory_name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Supervisor Name: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "sssss",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Capacity: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${inventory.capcity}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Center(
                        child: Button(
                          color: Colors.white,
                          press: () {},
                          text: "View Orders",
                          textColor: Theme.of(context).primaryColor,
                          width: size.width * 0.6,
                        ),
                      ),
                      Center(
                        child: Button(
                          color: Color(0xFFF1E6FF),
                          press: () {},
                          text: "Contact SuperVisor",
                          textColor: Theme.of(context).primaryColor,
                          width: size.width * 0.6,
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
