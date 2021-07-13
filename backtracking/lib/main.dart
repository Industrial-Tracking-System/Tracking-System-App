import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/products.dart';

import 'Screens/home.dart';
import 'Screens/production.dart';
import 'Screens/Login/LogIn_Screen.dart';
import 'Screens/Welcome/Welcome_Screen.dart';
import 'Screens/SignUp/SignUp_Screen.dart';
import 'Screens/orders_Screen.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Back Tracking',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Color.fromRGBO(255, 251, 102, 1),
          textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 20),
              bodyText2: TextStyle(fontSize: 30)),
        ),
        home: WelcomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          ProductionScreen.routeName: (context) => ProductionScreen(),
          LogInScreen.routeName: (context) => LogInScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
        },
      ),
    );
  }
}
