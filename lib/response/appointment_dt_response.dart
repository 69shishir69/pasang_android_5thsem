import 'package:json_annotation/json_annotation.dart';
import 'package:nailroom/model/date_time.dart';
part 'appointment_dt_response.g.dart';

@JsonSerializable()
class AppointmentDTResponse {
  bool? success;
  List<DateAndTime>? data;

  AppointmentDTResponse({this.success, this.data});

  factory AppointmentDTResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDTResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentDTResponseToJson(this);
}
