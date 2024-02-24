import 'dart:convert';

class UserModel {
  String name;
  int mobileNo;
  String email;
  String password;
  String type;
  String id;
  String token;

  UserModel({
    required this.name,
    required this.mobileNo,
    required this.email,
    required this.password,
    required this.type,
    required this.id,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobileNo': mobileNo,
      'email': email,
      'password': password,
      'type': type,
      '_id': id,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      mobileNo: map['mobileNo'] as int,
      email: map['email'] as String,
      password: map['password'] as String,
      type: map['type'] as String,
      id: map['_id'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
