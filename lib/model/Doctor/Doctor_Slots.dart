// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DoctorSlot {
  String id;
  int? index;
  int? patientid;
  String doctorname;
  String doctorid;
  String startTime;
  String endTime;
  String? patientName;
  bool isAvailable;
  int date;
  DoctorSlot({
    required this.id,
    this.index,
    this.patientid,
    required this.doctorname,
    required this.doctorid,
    required this.startTime,
    required this.endTime,
    this.patientName,
    required this.isAvailable,
    required this.date,
  });

  DoctorSlot copyWith({
    String? id,
    int? index,
    int? patientid,
    String? doctorname,
    String? doctorid,
    String? startTime,
    String? endTime,
    String? patientName,
    bool? isAvailable,
    int? date,
  }) {
    return DoctorSlot(
      id: id ?? this.id,
      index: index ?? this.index,
      patientid: patientid ?? this.patientid,
      doctorname: doctorname ?? this.doctorname,
      doctorid: doctorid ?? this.doctorid,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      patientName: patientName ?? this.patientName,
      isAvailable: isAvailable ?? this.isAvailable,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'index': index,
      'patientid': patientid,
      'doctorname': doctorname,
      'doctorid': doctorid,
      'startTime': startTime,
      'endTime': endTime,
      'patientName': patientName,
      'isAvailable': isAvailable,
      'date': date,
    };
  }

  factory DoctorSlot.fromMap(Map<String, dynamic> map) {
    return DoctorSlot(
      id: map['id'] as String,
      index: map['index'] != null ? map['index'] as int : null,
      patientid: map['patientid'] != null ? map['patientid'] as int : null,
      doctorname: map['doctorname'] as String,
      doctorid: map['doctorid'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      patientName:
          map['patientName'] != null ? map['patientName'] as String : null,
      isAvailable: map['isAvailable'] as bool,
      date: map['date'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorSlot.fromJson(String source) =>
      DoctorSlot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoctorSlot(id: $id, index: $index, patientid: $patientid, doctorname: $doctorname, doctorid: $doctorid, startTime: $startTime, endTime: $endTime, patientName: $patientName, isAvailable: $isAvailable, date: $date)';
  }

  @override
  bool operator ==(covariant DoctorSlot other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.index == index &&
        other.patientid == patientid &&
        other.doctorname == doctorname &&
        other.doctorid == doctorid &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.patientName == patientName &&
        other.isAvailable == isAvailable &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        index.hashCode ^
        patientid.hashCode ^
        doctorname.hashCode ^
        doctorid.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        patientName.hashCode ^
        isAvailable.hashCode ^
        date.hashCode;
  }
}
