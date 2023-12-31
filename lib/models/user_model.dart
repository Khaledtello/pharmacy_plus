class UserModel {
  int? id;
  String? name;
  String? phoneNumber;
  String? role;
  String? password;

  UserModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.role,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "password": password,
        "role": role,
      };

}
