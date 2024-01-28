class OrderModel {
  String name;
  int quantity;
  int price;
  OrderModel({this.name, this.quantity, this.price});
  Map toJson() => {
    'name': name,
    'quantity': quantity,
    'price':price
  };

  @override
  String toString() {
    return '{ ${this.name}, ${this.quantity},${this.price} }';
  }
}