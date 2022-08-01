import 'package:json_annotation/json_annotation.dart';
part 'date_time.g.dart';

@JsonSerializable()
class DateAndTime {
  @JsonKey(name: "_id")
  String? id;
  String? date;
  List<String?> time;

  DateAndTime({this.id, this.date, required this.time});

  factory DateAndTime.fromJson(Map<String, dynamic> json) =>
      _$DateAndTimeFromJson(json);

  Map<String, dynamic> toJson() => _$DateAndTimeToJson(this);
}
