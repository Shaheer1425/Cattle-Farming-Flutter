// class IncomeRecord {
//   final String name;
//   final String date;
//   final String money;

//   IncomeRecord({
//     required this.name,
//     required this.date,
//     required this.money,
//   });
// }

// class CattleSaleRecord {
//   final int id;
//   final String date;
//   final double? amount;
//   final int customerId;
//   final String cattleTag;
//   final int farmId;

//   CattleSaleRecord({
//     required this.id,
//     required this.date,
//     this.amount,
//     required this.customerId,
//     required this.cattleTag,
//     required this.farmId,
//   });

//   factory CattleSaleRecord.fromJson(Map<String, dynamic> json) {
//     return CattleSaleRecord(
//       id: json['ID'],
//       date: json['Date'],
//       amount: json['Amount'] != null ? json['Amount'].toDouble() : null,
//       customerId: json['CustomerID'],
//       cattleTag: json['CattleTag'],
//       farmId: json['FarmId'],
//     );
//   }
// }

// class MilkSaleRecord {
//   final int id;
//   final double? quantity;
//   final String date;
//   final double? perLtrPrice;
//   final int customerId;
//   final double? earn;
//   final String note;
//   final String cattleType;
//   final int farmId;

//   MilkSaleRecord({
//     required this.id,
//     this.quantity,
//     required this.date,
//     this.perLtrPrice,
//     required this.customerId,
//     this.earn,
//     required this.note,
//     required this.cattleType,
//     required this.farmId,
//   });

//   factory MilkSaleRecord.fromJson(Map<String, dynamic> json) {
//     return MilkSaleRecord(
//       id: json['ID'],
//       quantity: json['Quantity'] != null ? json['Quantity'].toDouble() : null,
//       date: json['Date'],
//       perLtrPrice:
//           json['PerLtrPrice'] != null ? json['PerLtrPrice'].toDouble() : null,
//       customerId: json['CustomerID'],
//       earn: json['Earn'] != null ? json['Earn'].toDouble() : null,
//       note: json['Note'],
//       cattleType: json['CattleType'],
//       farmId: json['FarmId'],
//     );
//   }
// }
