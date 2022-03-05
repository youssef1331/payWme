class UserModel {
  late String? name;
  late String? phone;
  late String? email;
  late String? uId;

  UserModel({
    this.name,
    this.phone,
    this.email,
    this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'uId': uId,
    };
  }
}
