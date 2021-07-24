import 'dart:convert';

import 'package:backtracking/Modules/employee.dart';
import 'package:backtracking/api/api.dart';
import 'package:flutter/material.dart';

class Employees with ChangeNotifier {
  List<Employee> _list = [];
  Employee _currentUserdata;
  Future<void> fetchandSetData() async {
    final response = await CallApi().getData("employees");
    final userData = json.decode(response.body) as List<dynamic>;
    final List<Employee> loadedEmployees = [];
    for (var i = 0; i < userData.length; i++) {
      loadedEmployees.add(
        Employee(
            empolyee_id: userData[i]["id"].toString(),
            name: userData[i]["name"],
            available: userData[i]["available"],
            email: userData[i]["email"],
            job_title: userData[i]["job_tittle"],
            factory_id: userData[i]["factory_id"],
            isManger: userData[i]["is_manager"],
            phone: userData[i]["phone"],
            imageUrl: userData[i]["imageUrl"]),
      );
    }

    _list = loadedEmployees;
    notifyListeners();
  }

  void setCurrentEmployeeData(Map<String, dynamic> userData) {
    _currentUserdata = Employee(
        empolyee_id: userData["id"].toString(),
        name: userData["name"],
        available: userData["available"],
        email: userData["email"],
        job_title: userData["job_tittle"],
        factory_id: userData["factory_id"],
        isManger: userData["is_manager"],
        phone: userData["phone"],
        imageUrl: userData["imageUrl"]);
  }

  get getCurrentEmployeeData {
    return _currentUserdata;
  }

  get getEmployees {
    return [..._list];
  }

  Employee findEmployeeByid(String id) {
    return _list.firstWhere((employee) => employee.empolyee_id == id);
  }
}
