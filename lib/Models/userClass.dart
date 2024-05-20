class User {
  String name, password, email, contact, farm, role;
  User(
      {required this.name,
      required this.password,
      required this.contact,
      required this.email,
      required this.farm,
      required this.role});

  // Map<String,dynamic> toMap()
  // {
  //   return <String,dynamic>{
  //     "username": username,
  //     "fullname": fullname,
  //     "password": password,
  //     "email": email,
  //     "mobile": mobile,
  //     "gender": gender
  //   };
  // }
}
