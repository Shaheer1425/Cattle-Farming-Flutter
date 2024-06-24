// class ExpenseRecord {
//   final String name;
//   final String date;
//   final String money;

//   ExpenseRecord({
//     required this.name,
//     required this.date,
//     required this.money,
//   });
// }

// class VaccinationRecord {
//   final String type;
//   final String date;
//   final String price;

//   VaccinationRecord(
//       {required this.type, required this.date, required this.price});

//   factory VaccinationRecord.fromJson(Map<String, dynamic> json) {
//     return VaccinationRecord(
//       type: json['type'],
//       date: json['date'],
//       price: json['price'],
//     );
//   }
// }

// class FoodStock {
//   double? quantity;
//   String date;
//   String item;
//   double? price;
//   int farmId;

//   FoodStock({
//     this.quantity,
//     required this.date,
//     required this.item,
//     this.price,
//     required this.farmId,
//   });

//   Map<String, dynamic> toJson() => {
//         'Quantity': quantity,
//         'Date': date,
//         'Item': item,
//         'Price': price,
//         'FarmId': farmId,
//       };

//   factory FoodStock.fromJson(Map<String, dynamic> json) {
//     return FoodStock(
//       quantity: json['Quantity']?.toDouble(),
//       date: json['Date'],
//       item: json['Item'],
//       price: json['Price']?.toDouble(),
//       farmId: json['FarmId'],
//     );
//   }
// }
