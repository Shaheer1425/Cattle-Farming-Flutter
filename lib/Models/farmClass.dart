class FarmRecord {
  final int id;
  final String name;
  final String city;

  FarmRecord({
    required this.id,
    required this.name,
    required this.city,
  });

  factory FarmRecord.fromJson(Map<String, dynamic> json) {
    return FarmRecord(
      id: json['ID'],
      name: json['Name'],
      city: json['City'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'City': city,
    };
  }
}
