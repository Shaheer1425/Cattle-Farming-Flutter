class TemperatureRecord {
  final String temperature;
  final String date;
  final String time;

  TemperatureRecord({
    required this.temperature,
    required this.date,
    required this.time,
  });

  factory TemperatureRecord.fromJson(Map<String, dynamic> json) {
    return TemperatureRecord(
      temperature: json['Temperature1'],
      time: json['Time'],
      date: json['Date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Temperature1': temperature,
      'Time': time,
      'Date': date,
    };
  }
}
