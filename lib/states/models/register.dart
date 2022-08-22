class RegisterModel {
  RegisterModel({
    required this.customerId,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.firstLastName,
  });
  late final int customerId;
  late final String userName;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phoneNo;
  late final String password;
  late final String firstLastName;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    password = json['password'];
    firstLastName = json['firstLastName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['userName'] = userName;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phoneNo'] = phoneNo;
    data['password'] = password;
    data['firstLastName'] = firstLastName;
    return data;
  }
}
