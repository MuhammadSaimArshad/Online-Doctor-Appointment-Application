// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AdminModel {
  String name;
  String password;
  String email;
  String userid;
  AdminModel({
    required this.name,
    required this.password,
    required this.email,
    required this.userid,
  });

  AdminModel copyWith({
    String? name,
    String? password,
    String? email,
    String? userid,
  }) {
    return AdminModel(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      userid: userid ?? this.userid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
      'email': email,
      'userid': userid,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      userid: map['userid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) =>
      AdminModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminModel(name: $name, password: $password, email: $email, userid: $userid)';
  }

  @override
  bool operator ==(covariant AdminModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.password == password &&
        other.email == email &&
        other.userid == userid;
  }

  @override
  int get hashCode {
    return name.hashCode ^ password.hashCode ^ email.hashCode ^ userid.hashCode;
  }
}
