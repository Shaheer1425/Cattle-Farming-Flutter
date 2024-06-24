class MilkRecord {
  final String tag;
  final String date;
  final double totalMilk;
  final String time;

  MilkRecord(
      {required this.tag,
      required this.date,
      required this.totalMilk,
      required this.time});

  factory MilkRecord.fromJson(Map<String, dynamic> json) {
    return MilkRecord(
        tag: json['CattleTag'],
        date: json['Date'],
        totalMilk: json['TotalMilk'],
        time: json['Time']);
  }

  Map<String, dynamic> toJson() {
    return {
      'CattleTag': tag,
      'TotalMilk': totalMilk,
      'Time': time,
      'Date': date,
    };
  }
}
