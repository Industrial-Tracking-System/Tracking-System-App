class Inventory {
  final String inventory_id;
  int capcity;
  final String inventory_name;
  final String empolyee_id;
  final String location;
  final String factory_id;

  Inventory(
      {this.inventory_id,
      this.inventory_name,
      this.location,
      this.capcity,
      this.empolyee_id,
      this.factory_id});
}
