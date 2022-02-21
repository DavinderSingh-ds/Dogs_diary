// ignore_for_file: camel_case_types

class autoLoginModel {
  int? id;
  String userName;
  String userEmail;
  String userPassword;
  String confirmPassword;
  autoLoginModel({
    this.id,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.confirmPassword,
  });
  factory autoLoginModel.fromdatabaseJson(Map<String, dynamic> data) =>
      autoLoginModel(
        id: data['id'],
        userName: data['name'],
        userEmail: data['email'],
        userPassword: data['passwrd'],
        confirmPassword: data['cnfpsswrd'],
      );
  Map<String, dynamic> todatabaseJson() => {
        'id': this.id,
        'name': this.userName,
        'email': this.userEmail,
        'passwrd': this.userPassword,
        'cnfpsswrd': this.confirmPassword,
      };
}
