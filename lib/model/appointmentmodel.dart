// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppointmentModel {
  String id;
  String patientid;
  String doctorid;
  String doctername;
  String patientname;
  String slotsid;
  String time;
  int createdtime;
  int status;
  String bio;
  double? rating;
  String image;
  AppointmentModel({
    required this.id,
    required this.patientid,
    required this.doctorid,
    required this.doctername,
    required this.patientname,
    required this.slotsid,
    required this.time,
    required this.createdtime,
    required this.status,
    required this.bio,
    this.rating,
    required this.image,
  });

  AppointmentModel copyWith({
    String? id,
    String? patientid,
    String? doctorid,
    String? doctername,
    String? patientname,
    String? slotsid,
    String? time,
    int? createdtime,
    int? status,
    String? bio,
    double? rating,
    String? image,
  }) {
    return AppointmentModel(
      id: id ?? this.id,
      patientid: patientid ?? this.patientid,
      doctorid: doctorid ?? this.doctorid,
      doctername: doctername ?? this.doctername,
      patientname: patientname ?? this.patientname,
      slotsid: slotsid ?? this.slotsid,
      time: time ?? this.time,
      createdtime: createdtime ?? this.createdtime,
      status: status ?? this.status,
      bio: bio ?? this.bio,
      rating: rating ?? this.rating,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'patientid': patientid,
      'doctorid': doctorid,
      'doctername': doctername,
      'patientname': patientname,
      'slotsid': slotsid,
      'time': time,
      'createdtime': createdtime,
      'status': status,
      'bio': bio,
      'rating': rating,
      'image': image,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] as String,
      patientid: map['patientid'] as String,
      doctorid: map['doctorid'] as String,
      doctername: map['doctername'] as String,
      patientname: map['patientname'] as String,
      slotsid: map['slotsid'] as String,
      time: map['time'] as String,
      createdtime: map['createdtime'] as int,
      status: map['status'] as int,
      bio: map['bio'] as String,
      rating: map['rating'] != null ? map['rating'] as double : null,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppointmentModel(id: $id, patientid: $patientid, doctorid: $doctorid, doctername: $doctername, patientname: $patientname, slotsid: $slotsid, time: $time, createdtime: $createdtime, status: $status, bio: $bio, rating: $rating, image: $image)';
  }

  @override
  bool operator ==(covariant AppointmentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.patientid == patientid &&
        other.doctorid == doctorid &&
        other.doctername == doctername &&
        other.patientname == patientname &&
        other.slotsid == slotsid &&
        other.time == time &&
        other.createdtime == createdtime &&
        other.status == status &&
        other.bio == bio &&
        other.rating == rating &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        patientid.hashCode ^
        doctorid.hashCode ^
        doctername.hashCode ^
        patientname.hashCode ^
        slotsid.hashCode ^
        time.hashCode ^
        createdtime.hashCode ^
        status.hashCode ^
        bio.hashCode ^
        rating.hashCode ^
        image.hashCode;
  }
}
