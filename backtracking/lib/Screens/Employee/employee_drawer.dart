import 'package:backtracking/Modules/employee.dart';
import 'package:backtracking/Screens/Welcome/Welcome_Screen.dart';
import 'package:backtracking/providers/Employees.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Employees employeeProvider = Provider.of<Employees>(context, listen: false);
    Employee employeeData = employeeProvider.getCurrentEmployeeData;
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.purple[200],
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.only(
              top: 35,
              left: 15,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(employeeData.imageUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    employeeData.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    employeeData.email,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          ListTile(
            dense: true,
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: (){
              employeeProvider.logout();
              Navigator.of(context).pushReplacementNamed(
              WelcomeScreen.routeName);
            } 
            
          ),
        ],
      ),
    );
  }
}
