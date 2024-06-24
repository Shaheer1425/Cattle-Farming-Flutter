class cattleAvgMilkRecord {
  final String tag;

  final double averageMilk;
  final String cattletype;

  cattleAvgMilkRecord(
      {required this.tag, required this.averageMilk, required this.cattletype});

  factory cattleAvgMilkRecord.fromJson(Map<String, dynamic> json) {
    return cattleAvgMilkRecord(
      tag: json['Tag'],
      cattletype: json['CattleType'],
      averageMilk: json['AvgMilk']?.toDouble() ?? 0.0,
    );
  }
}
