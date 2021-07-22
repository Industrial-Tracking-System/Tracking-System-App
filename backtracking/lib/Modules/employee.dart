class Employee {
  final String empolyee_id;
  final String name;
  final int isManger;
  final String email;
  final String phone;
  int available;
  final String job_title;
  final String factory_id;

  Employee(
      {this.empolyee_id,
      this.isManger,
      this.available,
      this.email,
      this.factory_id,
      this.job_title,
      this.name,
      this.phone});
}
