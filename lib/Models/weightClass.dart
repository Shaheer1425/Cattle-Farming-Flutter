class WeightRecord {
  final String tag;
  final String date;
  final String weight;

  WeightRecord({
    required this.tag,
    required this.date,
    required this.weight,
  });

  factory WeightRecord.fromJson(Map<String, dynamic> json) {
    return WeightRecord(
      tag: json['CattleTag'],
      weight: json['Weight1'],
      date: json['Date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CattleTag': tag,
      'Weight1': weight,
      'Date': date,
    };
  }
}
