class AddMilkInfo {
  final String tag;
  final double totalMilk;
  final bool isAvailableToGiveMilk;

  AddMilkInfo({
    required this.tag,
    required this.totalMilk,
    required this.isAvailableToGiveMilk,
  });

  factory AddMilkInfo.fromJson(Map<String, dynamic> json) {
    return AddMilkInfo(
      tag: json['Tag'],
      totalMilk: (json['TotalMilk'] as num).toDouble(),
      isAvailableToGiveMilk: json['IsAvailableToGiveMilk'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Tag': tag,
      'TotalMilk': totalMilk,
      'IsAvailableToGiveMilk': isAvailableToGiveMilk,
    };
  }
}
