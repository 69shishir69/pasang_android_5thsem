import 'package:json_annotation/json_annotation.dart';
part 'book_appointment.g.dart';

@JsonSerializable()
class BookAppointment {
  String? date;
  String? time;
  String? fullname;
  String? mobile;
  String? email;

  BookAppointment({
    this.date,
    this.time,
    this.email,
    this.fullname,
    this.mobile,
  });

  factory BookAppointment.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentToJson(this);
}
