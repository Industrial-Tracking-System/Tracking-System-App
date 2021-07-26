class Customer {
  final String customer_id;

  final String customer_name;

  final String company_name;

  final double latitude;
  final double longtude;

  final String phone;

  final String email;

  final String apitoken;
  final String imageUrl;

  Customer(
      {this.customer_id,
      this.customer_name,
      this.email,
      this.latitude,
      this.longtude,
      this.phone,
      this.company_name,
      this.apitoken,
      this.imageUrl});
}
