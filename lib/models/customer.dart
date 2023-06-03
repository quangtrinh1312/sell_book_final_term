class Customer {
  Customer({
    this.name,
    this.quantity,
    this.price,
    this.total,
    this.isVIP,
  });

  String? name;
  int? quantity;
  double? price;
  double? total;
  bool? isVIP;
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'total': total,
      'isVIP': isVIP,
    };
  }
  
  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
    isVIP = json['isVIP'];
  }
}

final customerInitList = [
  Customer(name: 'Truyen', quantity: 8, price: 10000.0, isVIP: true),
  Customer(name: 'Trinh', quantity: 9, price: 10000.0),
  Customer(name: 'Dung', quantity: 999, price: 10000.0, isVIP: true),
];
