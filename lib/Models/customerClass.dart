class CustomerRecord {
  final String Name;
  final String address;
  final String contact;
  //final int farmId;

  CustomerRecord({
    required this.Name,
    required this.address,
    required this.contact,
    //   required this.farmId
  });

  factory CustomerRecord.fromJson(Map<String, dynamic> json) {
    return CustomerRecord(
        Name: json['Name'], address: json['Address'], contact: json['Contact']
        //   farmId: json['FarmId']
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': Name,
      'Address': address,
      'Contact': contact,
      //   'FarmId': farmId
    };
  }
}
