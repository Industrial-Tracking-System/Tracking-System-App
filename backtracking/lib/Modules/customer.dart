import 'package:location/location.dart';

class Customer {
  final String customer_id;

  final String customer_name;

  final String company_name;

  final Location location;

  final String phone;

  final String email;

  final String apitoken;

  Customer(
      {this.customer_id,
      this.customer_name,
      this.email,
      this.location,
      this.phone,
      this.company_name,
      this.apitoken});
}
