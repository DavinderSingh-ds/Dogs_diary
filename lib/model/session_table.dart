// ignore_for_file: camel_case_types

class sessionModel {
  int? id;
  String userName;
  String userEmail;
  String userPassword;
  String confirmPassword;
  sessionModel({
    this.id,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.confirmPassword,
  });
  factory sessionModel.fromdatabaseJson(Map<String, dynamic> data) =>
      sessionModel(
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
