class viewCattleRecord {
  final String tag;
  final String vaccineStatus;
  final double weight;
  final String cattleType;

  viewCattleRecord(
      {required this.tag,
      required this.vaccineStatus,
      required this.weight,
      required this.cattleType});

  factory viewCattleRecord.fromJson(Map<String, dynamic> json) {
    return viewCattleRecord(
      tag: json['Tag'],
      weight: json['Weight'],
      cattleType: json['CattleType'],
      vaccineStatus: json['isVaccinated'],
    );
  }
}
