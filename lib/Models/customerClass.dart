class CustomerRecord {
  final String name;
  final String address;
  final String contact;

  CustomerRecord({
    required this.name,
    required this.address,
    required this.contact,
  });

  factory CustomerRecord.fromJson(Map<String, dynamic> json) {
    return CustomerRecord(
      name: json['Name'],
      address: json['Address'],
      contact: json['Contact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Address': address,
      'Contact': contact,
    };
  }
}
