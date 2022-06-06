import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'time_model.g.dart';

@JsonSerializable()
class TimeModel extends INetworkModel<TimeModel> {
  int? year;
  int? month;
  int? day;
  int? hour;
  int? minute;
  int? seconds;
  int? milliSeconds;
  String? dateTime;
  String? date;
  String? time;
  String? timeZone;
  String? dayOfWeek;
  bool? dstActive;

  TimeModel({
    this.year,
    this.month,
    this.day,
    this.hour,
    this.minute,
    this.seconds,
    this.milliSeconds,
    this.dateTime,
    this.date,
    this.time,
    this.timeZone,
    this.dayOfWeek,
    this.dstActive,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) =>
      _$TimeModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimeModelToJson(this);

  @override
  TimeModel fromJson(Map<String, dynamic> json) {
    return _$TimeModelFromJson(json);
  }
}
