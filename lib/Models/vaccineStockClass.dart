class Vaccination {
  int? id;
  String type;
  String duration;
  int? totalDose;
  int? price;
  String date;
  int farmId;

  Vaccination({
    this.id,
    required this.type,
    required this.duration,
    this.totalDose,
    this.price,
    required this.date,
    required this.farmId,
  });

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Type': type,
        'Duration': duration,
        'TotalDose': totalDose,
        'Price': price,
        'Date': date,
        'FarmId': farmId,
      };

  factory Vaccination.fromJson(Map<String, dynamic> json) {
    return Vaccination(
      id: json['ID'],
      type: json['Type'],
      duration: json['Duration'],
      totalDose: json['TotalDose'],
      price: json['Price'],
      date: json['Date'],
      farmId: json['FarmId'],
    );
  }
}
