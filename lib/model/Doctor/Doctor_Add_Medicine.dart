// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DoctorAddMedicineModel {
  String medicine1;
  String time1;
  String medicine2;
  String time2;
  String medicine3;
  String time3;
  String medicine4;
  String time4;
  String medicine5;
  String time5;
  String medicine6;
  String time6;
  String id;

  String day;
  DoctorAddMedicineModel({
    required this.medicine1,
    required this.time1,
    required this.medicine2,
    required this.time2,
    required this.medicine3,
    required this.time3,
    required this.medicine4,
    required this.time4,
    required this.medicine5,
    required this.time5,
    required this.medicine6,
    required this.time6,
    required this.id,
    required this.day,
  });

  DoctorAddMedicineModel copyWith({
    String? medicine1,
    String? time1,
    String? medicine2,
    String? time2,
    String? medicine3,
    String? time3,
    String? medicine4,
    String? time4,
    String? medicine5,
    String? time5,
    String? medicine6,
    String? time6,
    String? id,
    String? day,
  }) {
    return DoctorAddMedicineModel(
      medicine1: medicine1 ?? this.medicine1,
      time1: time1 ?? this.time1,
      medicine2: medicine2 ?? this.medicine2,
      time2: time2 ?? this.time2,
      medicine3: medicine3 ?? this.medicine3,
      time3: time3 ?? this.time3,
      medicine4: medicine4 ?? this.medicine4,
      time4: time4 ?? this.time4,
      medicine5: medicine5 ?? this.medicine5,
      time5: time5 ?? this.time5,
      medicine6: medicine6 ?? this.medicine6,
      time6: time6 ?? this.time6,
      id: id ?? this.id,
      day: day ?? this.day,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'medicine1': medicine1,
      'time1': time1,
      'medicine2': medicine2,
      'time2': time2,
      'medicine3': medicine3,
      'time3': time3,
      'medicine4': medicine4,
      'time4': time4,
      'medicine5': medicine5,
      'time5': time5,
      'medicine6': medicine6,
      'time6': time6,
      'id': id,
      'day': day,
    };
  }

  factory DoctorAddMedicineModel.fromMap(Map<String, dynamic> map) {
    return DoctorAddMedicineModel(
      medicine1: map['medicine1'] as String,
      time1: map['time1'] as String,
      medicine2: map['medicine2'] as String,
      time2: map['time2'] as String,
      medicine3: map['medicine3'] as String,
      time3: map['time3'] as String,
      medicine4: map['medicine4'] as String,
      time4: map['time4'] as String,
      medicine5: map['medicine5'] as String,
      time5: map['time5'] as String,
      medicine6: map['medicine6'] as String,
      time6: map['time6'] as String,
      id: map['id'] as String,
      day: map['day'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DoctorAddMedicineModel.fromJson(String source) =>
      DoctorAddMedicineModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DoctorAddMedicineModel(medicine1: $medicine1, time1: $time1, medicine2: $medicine2, time2: $time2, medicine3: $medicine3, time3: $time3, medicine4: $medicine4, time4: $time4, medicine5: $medicine5, time5: $time5, medicine6: $medicine6, time6: $time6, id: $id, day: $day)';
  }

  @override
  bool operator ==(covariant DoctorAddMedicineModel other) {
    if (identical(this, other)) return true;

    return other.medicine1 == medicine1 &&
        other.time1 == time1 &&
        other.medicine2 == medicine2 &&
        other.time2 == time2 &&
        other.medicine3 == medicine3 &&
        other.time3 == time3 &&
        other.medicine4 == medicine4 &&
        other.time4 == time4 &&
        other.medicine5 == medicine5 &&
        other.time5 == time5 &&
        other.medicine6 == medicine6 &&
        other.time6 == time6 &&
        other.id == id &&
        other.day == day;
  }

  @override
  int get hashCode {
    return medicine1.hashCode ^
        time1.hashCode ^
        medicine2.hashCode ^
        time2.hashCode ^
        medicine3.hashCode ^
        time3.hashCode ^
        medicine4.hashCode ^
        time4.hashCode ^
        medicine5.hashCode ^
        time5.hashCode ^
        medicine6.hashCode ^
        time6.hashCode ^
        id.hashCode ^
        day.hashCode;
  }
}
