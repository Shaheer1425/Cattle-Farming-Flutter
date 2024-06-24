class WeightRecord {
  final String tag;
  final String date;
  final String weight;
  final String height;
  //final int farmId;
  WeightRecord(
      {required this.tag,
      required this.date,
      required this.weight,
      required this.height
      //  required this.farmId
      });

  factory WeightRecord.fromJson(Map<String, dynamic> json) {
    return WeightRecord(
      tag: json['CattleTag'],
      weight: json['Weight1'],
      date: json['Date'],
      height: json['Height'],
      //   farmId: json['FarmId']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CattleTag': tag,
      'Weight1': weight,
      'Date': date,
      'Height': height,
      //  'FarmId': farmId
    };
  }
}
