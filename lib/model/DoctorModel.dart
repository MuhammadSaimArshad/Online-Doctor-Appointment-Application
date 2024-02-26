// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DoctorModel {
  String id;
  String name;
  String phonenumber;
  String email;
  String password;
  String token;
  String image;
  bool audiocallStatus;
  bool callStatus;
  String type;
  String status;
  String roomId;
  String bio;
  String specialty;
  String starttime;
  String endtime;
  String about;
  String address;
  int maxAppointmentDuration;
  double totalrating;
  int ratingperson;
  List<String>? patientList;
  double fee;
  String category;
  DoctorModel({
    required this.id,
    required this.name,
    required this.phonenumber,
    required this.email,
    required this.password,
    required this.token,
    required this.image,
    required this.audiocallStatus,
    required this.callStatus,
    required this.type,
    required this.status,
    required this.roomId,
    required this.bio,
    required this.specialty,
    required this.starttime,
    required this.endtime,
    required this.about,
    required this.address,
    required this.maxAppointmentDuration,
    required this.totalrating,
    required this.ratingperson,
    this.patientList,
    required this.fee,
    required this.category,
  });

  DoctorModel copyWith({
    String? id,
    String? name,
    String? phonenumber,
    String? email,
    String? password,
    String? token,
    String? image,
    bool? audiocallStatus,
    bool? callStatus,
    String? type,
    String? status,
    String? roomId,
    String? bio,
    String? specialty,
    String? starttime,
    String? endtime,
    String? about,
    String? address,
    int? maxAppointmentDuration,
    double? totalrating,
    int? ratingperson,
    List<String>? patientList,
    double? fee,
    String? category,
  }) {
    return DoctorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      image: image ?? this.image,
      audiocallStatus: audiocallStatus ?? this.audiocallStatus,
      callStatus: callStatus ?? this.callStatus,
      type: type ?? this.type,
      status: status ?? this.status,
      roomId: roomId ?? this.roomId,
      bio: bio ?? this.bio,
      specialty: specialty ?? this.specialty,
      starttime: starttime ?? this.starttime,
      endtime: endtime ?? this.endtime,
      about: about ?? this.about,
      address: address ?? this.address,
      maxAppointmentDuration:
          maxAppointmentDuration ?? this.maxAppointmentDuration,
      totalrating: totalrating ?? this.totalrating,
      ratingperson: ratingperson ?? this.ratingperson,
      patientList: patientList ?? this.patientList,
      fee: fee ?? this.fee,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phonenumber': phonenumber,
      'email': email,
      'password': password,
      'token': token,
      'image': image,
      'audiocallStatus': audiocallStatus,
      'callStatus': callStatus,
      'type': type,
      'status': status,
      'roomId': roomId,
      'bio': bio,
      'specialty': specialty,
      'starttime': starttime,
      'endtime': endtime,
      'about': about,
      'address': address,
      'maxAppointmentDuration': maxAppointmentDuration,
      'totalrating': totalrating,
      'ratingperson': ratingperson,
      'patientList': patientList,
      'fee': fee,
      'category': category,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      id: map['id'] as String,
      name: map['name'] as String,
      phonenumber: map['phonenumber'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      token: map['token'] as String,
      image: map['image'] as String,
      audiocallStatus: map['audiocallStatus'] as bool,
      callStatus: map['callStatus'] as bool,
      type: map['type'] as String,
      status: map['status'] as String,
      roomId: map['roomId'] as String,
      bio: map['bio'] as String,
      specialty: map['specialty'] as String,
      starttime: map['starttime'] as String,
      endtime: map['endtime'] as String,
      about: map['about'] as String,
      address: map['address'] as String,
      maxAppointmentDuration: map['maxAppointmentDuration'] as int,
      totalrating: map['totalrating'] as double,
      ratingperson: map['ratingperson'] as int,
      patientList: map['patientList'] != null
          ? List<String>.from(map['patientList'] as List<dynamic>)
          : null,
      fee: map['fee'] as double,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorModel.fromJson(String source) =>
      DoctorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoctorModel(id: $id, name: $name, phonenumber: $phonenumber, email: $email, password: $password, token: $token, image: $image, audiocallStatus: $audiocallStatus, callStatus: $callStatus, type: $type, status: $status, roomId: $roomId, bio: $bio, specialty: $specialty, starttime: $starttime, endtime: $endtime, about: $about, address: $address, maxAppointmentDuration: $maxAppointmentDuration, totalrating: $totalrating, ratingperson: $ratingperson, patientList: $patientList, fee: $fee, category: $category)';
  }

  @override
  bool operator ==(covariant DoctorModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phonenumber == phonenumber &&
        other.email == email &&
        other.password == password &&
        other.token == token &&
        other.image == image &&
        other.audiocallStatus == audiocallStatus &&
        other.callStatus == callStatus &&
        other.type == type &&
        other.status == status &&
        other.roomId == roomId &&
        other.bio == bio &&
        other.specialty == specialty &&
        other.starttime == starttime &&
        other.endtime == endtime &&
        other.about == about &&
        other.address == address &&
        other.maxAppointmentDuration == maxAppointmentDuration &&
        other.totalrating == totalrating &&
        other.ratingperson == ratingperson &&
        listEquals(other.patientList, patientList) &&
        other.fee == fee &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phonenumber.hashCode ^
        email.hashCode ^
        password.hashCode ^
        token.hashCode ^
        image.hashCode ^
        audiocallStatus.hashCode ^
        callStatus.hashCode ^
        type.hashCode ^
        status.hashCode ^
        roomId.hashCode ^
        bio.hashCode ^
        specialty.hashCode ^
        starttime.hashCode ^
        endtime.hashCode ^
        about.hashCode ^
        address.hashCode ^
        maxAppointmentDuration.hashCode ^
        totalrating.hashCode ^
        ratingperson.hashCode ^
        patientList.hashCode ^
        fee.hashCode ^
        category.hashCode;
  }
}
