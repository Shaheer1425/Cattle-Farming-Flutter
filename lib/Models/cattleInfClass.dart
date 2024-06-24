class CattleInfo {
  final String weight;
  final String gender;
  final String age;
  final String? purchaseDate;
  final String cost;
  //final String expense;
  final String? vaccine;
  final String? vaccineDate;

  CattleInfo({
    required this.weight,
    required this.gender,
    required this.age,
    this.purchaseDate,
    required this.cost,
    //   required this.expense,
    this.vaccine,
    this.vaccineDate,
  });

  factory CattleInfo.fromJson(Map<String, dynamic> json) {
    return CattleInfo(
      weight: json['Weight'] ?? '',
      gender: json['Gender'] ?? '',
      age: json['Age'] ?? '',
      purchaseDate: json['PurchaseDate'],
      cost: json['PurchaseCost'] ?? 0,
      // expense: json['Expense'] ?? '',
      vaccine: json['VaccineType'],
      vaccineDate: json['VaccineDate'],
    );
  }
}
