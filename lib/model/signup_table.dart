// ignore_for_file: camel_case_types

class signUpModel {
  int? id;
  String userName;
  String userEmail;
  String userPassword;
  String confirmPassword;
  signUpModel({
    this.id,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.confirmPassword,
  });
  factory signUpModel.fromdatabaseJson(Map<String, dynamic> data) =>
      signUpModel(
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
