class MilkRecord {
  final String tag;
  final String date;
  final int totalMilk;
  final int consumedMilk;

  MilkRecord(
      {required this.tag,
      required this.date,
      required this.totalMilk,
      required this.consumedMilk});

  factory MilkRecord.fromJson(Map<String, dynamic> json) {
    return MilkRecord(
        tag: json['CattleTag'],
        date: json['Date'],
        totalMilk: json['TotalMilk'],
        consumedMilk: json['UsedMilk']);
  }

  Map<String, dynamic> toJson() {
    return {
      'CattleTag': tag,
      'TotalMilk': totalMilk,
      'UsedMilk': consumedMilk,
      'Date': date,
    };
  }
}
