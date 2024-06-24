class MilkSaleRecord {
  final String date;
  final String?
      cattleType; // Make it nullable since it may not be set for all entries
  final double quantity;
  final double pricePerLitre;
  final double totalPrice;
  final int customerid;
  final String note;
  final int farmId;
  MilkSaleRecord({
    required this.date,
    this.cattleType,
    required this.quantity,
    required this.pricePerLitre,
    required this.totalPrice,
    required this.customerid,
    required this.note,
    required this.farmId,
  });

  Map<String, dynamic> toJson() {
    return {
      'Date': date,
      'CattleType': cattleType,
      'Quantity': quantity,
      'PerLtrPrice': pricePerLitre,
      'Earn': totalPrice,
      'CustomerID': customerid,
      'Note': note,
      'FarmId': farmId,
    };
  }

  factory MilkSaleRecord.fromJson(Map<String, dynamic> json) {
    return MilkSaleRecord(
      quantity: json['Quantity'] != null ? json['Quantity'].toDouble() : null,
      date: json['Date'],
      pricePerLitre:
          json['PerLtrPrice'] != null ? json['PerLtrPrice'].toDouble() : null,
      customerid: json['CustomerID'],
      totalPrice: json['Earn'] != null ? json['Earn'].toDouble() : null,
      note: json['Note'],
      cattleType: json['CattleType'],
      farmId: json['FarmId'],
    );
  }
}
