import 'package:backtracking/Screens/Employee/employee_Home_screen.dart';
import 'package:backtracking/Screens/Login/login_options.dart';
import 'package:backtracking/Screens/Manager/OrderDetailsScreen.dart';
import 'package:backtracking/Screens/Manager/clientsScreen.dart';
import 'package:backtracking/Screens/Customer/customer_home.dart';
import 'package:backtracking/Screens/Manager/storeScreen.dart';
import 'package:backtracking/Screens/Manager/viewOrders.dart';
import 'package:backtracking/providers/Orders.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:backtracking/providers/inventories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Manager/ClientDetailsScreen.dart';
import 'Screens/Manager/StoreDetailsScreen.dart';
import 'providers/products.dart';

import 'Screens/Manager/production.dart';
import 'Screens/Login/LogIn_Screen.dart';
import 'Screens/Welcome/Welcome_Screen.dart';
import 'Screens/SignUp/SignUp_Screen.dart';
import 'Screens/Manager/orders_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Products>(
          create: (_) {
            return Products();
          },
        ),
        ChangeNotifierProvider<Orders>(
          create: (_) {
            return Orders();
          },
        ),
        ChangeNotifierProvider<Customers>(
          create: (_) {
            return Customers();
          },
        ),
        ChangeNotifierProvider<Inventories>(
          create: (_) {
            return Inventories();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Back Tracking',
        theme: ThemeData(
          primaryColor: Color(0xFF6F35A5),
          accentColor: Color.fromRGBO(255, 251, 102, 1),
          textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 20),
              bodyText2: TextStyle(fontSize: 30)),
        ),
        home: WelcomeScreen(),
        routes: {
          ProductionScreen.routeName: (context) => ProductionScreen(),
          LogInScreen.routeName: (context) => LogInScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          OrderDetailsScreen.routename: (context) => OrderDetailsScreen(),
          ClientsScreen.routeName: (context) => ClientsScreen(),
          ClientDetailsScreen.routename: (context) => ClientDetailsScreen(),
          StoreScreen.routeName: (context) => StoreScreen(),
          StoreDetailsScreen.routename: (context) => StoreDetailsScreen(),
          CustomerHomePage.routeName: (context) => CustomerHomePage(),
          LoginOptions.routeName: (context) => LoginOptions(),
          EmployeeHomePage.routeName: (context) => EmployeeHomePage(),
          ViewOrdersScreen.routeName: (context) => ViewOrdersScreen()
        },
      ),
    );
  }
}
