import 'package:backtracking/Screens/Welcome/Welcome_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/products.dart';
import 'Screens/home.dart';
import 'Screens/production.dart';

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
          ProductionScreen.routeName: (context) => ProductionScreen()
        },
      ),
    );
  }
}
