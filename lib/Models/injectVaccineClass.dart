class InjectedVaccination {
  final String date;
  final int vaccinationId;
  final String cattleTag;
  final int? doseNo;
  final int farmId;

  InjectedVaccination({
    required this.date,
    required this.vaccinationId,
    required this.cattleTag,
    required this.doseNo,
    required this.farmId,
  });

  factory InjectedVaccination.fromJson(Map<String, dynamic> json) {
    return InjectedVaccination(
      date: json['Date'],
      vaccinationId: json['VaccinationID'],
      cattleTag: json['CattleTag'],
      doseNo: json['DoseNo'],
      farmId: json['FarmId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Date': date,
      'VaccinationID': vaccinationId,
      'CattleTag': cattleTag,
      'DoseNo': doseNo,
      'FarmId': farmId,
    };
  }
}
