class CattleSale {
  int id;
  String date;
  double? amount;
  int customerId;
  String cattleTag;
  int farmId;

  CattleSale({
    required this.id,
    required this.date,
    this.amount,
    required this.customerId,
    required this.cattleTag,
    required this.farmId,
  });

  factory CattleSale.fromJson(Map<String, dynamic> json) {
    return CattleSale(
      id: json['ID'],
      date: json['Date'],
      amount: json['Amount'] != null ? json['Amount'].toDouble() : null,
      customerId: json['CustomerID'],
      cattleTag: json['CattleTag'],
      farmId: json['FarmId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['Date'] = this.date;
    data['Amount'] = this.amount;
    data['CustomerID'] = this.customerId;
    data['CattleTag'] = this.cattleTag;
    data['FarmId'] = this.farmId;
    return data;
  }
}
