class FoodStock {
  int? id;
  double? quantity;
  String date;
  String item;
  double? price;
  int farmId;

  FoodStock({
    this.id,
    this.quantity,
    required this.date,
    required this.item,
    this.price,
    required this.farmId,
  });

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Quantity': quantity,
        'Date': date,
        'Item': item,
        'Price': price,
        'FarmId': farmId,
      };

  factory FoodStock.fromJson(Map<String, dynamic> json) {
    return FoodStock(
      id: json['ID'],
      quantity: json['Quantity'],
      date: json['Date'],
      item: json['Item'],
      price: json['Price'],
      farmId: json['FarmId'],
    );
  }
}
