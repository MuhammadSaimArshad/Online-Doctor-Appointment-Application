// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PatientModel {
  String id;
  String name;
  String phonenumber;
  String password;
  String email;
  String token;
  String image;
  bool audiocallStatus;
  bool callStatus;
  String type;
  String status;
  String roomId;
  List<String>? doctorList;
  PatientModel({
    required this.id,
    required this.name,
    required this.phonenumber,
    required this.password,
    required this.email,
    required this.token,
    required this.image,
    required this.audiocallStatus,
    required this.callStatus,
    required this.type,
    required this.status,
    required this.roomId,
    this.doctorList,
  });

  PatientModel copyWith({
    String? id,
    String? name,
    String? phonenumber,
    String? password,
    String? email,
    String? token,
    String? image,
    bool? audiocallStatus,
    bool? callStatus,
    String? type,
    String? status,
    String? roomId,
    List<String>? doctorList,
  }) {
    return PatientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phonenumber: phonenumber ?? this.phonenumber,
      password: password ?? this.password,
      email: email ?? this.email,
      token: token ?? this.token,
      image: image ?? this.image,
      audiocallStatus: audiocallStatus ?? this.audiocallStatus,
      callStatus: callStatus ?? this.callStatus,
      type: type ?? this.type,
      status: status ?? this.status,
      roomId: roomId ?? this.roomId,
      doctorList: doctorList ?? this.doctorList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phonenumber': phonenumber,
      'password': password,
      'email': email,
      'token': token,
      'image': image,
      'audiocallStatus': audiocallStatus,
      'callStatus': callStatus,
      'type': type,
      'status': status,
      'roomId': roomId,
      'doctorList': doctorList,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phonenumber: map['phonenumber'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      token: map['token'] as String,
      image: map['image'] as String,
      audiocallStatus: map['audiocallStatus'] as bool,
      callStatus: map['callStatus'] as bool,
      type: map['type'] as String,
      status: map['status'] as String,
      roomId: map['roomId'] as String,
      doctorList: map['doctorList'] != null
          ? List<String>.from(map['doctorList'] as List<dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PatientModel.fromJson(String source) =>
      PatientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PatientModel(id: $id, name: $name, phonenumber: $phonenumber, password: $password, email: $email, token: $token, image: $image, audiocallStatus: $audiocallStatus, callStatus: $callStatus, type: $type, status: $status, roomId: $roomId, doctorList: $doctorList)';
  }

  @override
  bool operator ==(covariant PatientModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phonenumber == phonenumber &&
        other.password == password &&
        other.email == email &&
        other.token == token &&
        other.image == image &&
        other.audiocallStatus == audiocallStatus &&
        other.callStatus == callStatus &&
        other.type == type &&
        other.status == status &&
        other.roomId == roomId &&
        listEquals(other.doctorList, doctorList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phonenumber.hashCode ^
        password.hashCode ^
        email.hashCode ^
        token.hashCode ^
        image.hashCode ^
        audiocallStatus.hashCode ^
        callStatus.hashCode ^
        type.hashCode ^
        status.hashCode ^
        roomId.hashCode ^
        doctorList.hashCode;
  }
}
