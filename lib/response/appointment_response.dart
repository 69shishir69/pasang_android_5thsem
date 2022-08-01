import 'package:json_annotation/json_annotation.dart';
part "appointment_response.g.dart";

@JsonSerializable()
class AppointmentResponse {
  @JsonKey(name: "_id")
  String? id;
  String? date;
  String? time;
  String? fullname;
  String? mobile;
  String? email;
  String? customerId;

  AppointmentResponse({
    this.date,
    this.email,
    this.fullname,
    this.id,
    this.mobile,
    this.customerId,
    this.time,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentResponseToJson(this);
}
