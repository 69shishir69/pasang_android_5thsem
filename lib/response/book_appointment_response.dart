import 'package:json_annotation/json_annotation.dart';
import 'package:nailroom/response/appointment_response.dart';
part 'book_appointment_response.g.dart';

@JsonSerializable()
class BookAppointmentResponse {
  bool? success;
  List<AppointmentResponse>? data;

  BookAppointmentResponse({
    this.data,
    this.success,
  });

  factory BookAppointmentResponse.fromJson(Map<String, dynamic> json) =>
      _$BookAppointmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookAppointmentResponseToJson(this);
}
