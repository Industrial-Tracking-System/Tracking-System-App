import 'package:location/location.dart';

import 'package:flutter/foundation.dart';

class Customer {
  @required
  final String customer_id;
  @required
  final String customer_name;
  @required
  final String company_name;
  @required
  final Location location;
  @required
  final String phone;
  @required
  final String email;

  Customer(
      {this.customer_id,
      this.customer_name,
      this.email,
      this.location,
      this.phone,
      this.company_name});
}
