// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeModel _$TimeModelFromJson(Map<String, dynamic> json) => TimeModel(
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
      seconds: json['seconds'] as int?,
      milliSeconds: json['milliSeconds'] as int?,
      dateTime: json['dateTime'] as String?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      timeZone: json['timeZone'] as String?,
      dayOfWeek: json['dayOfWeek'] as String?,
      dstActive: json['dstActive'] as bool?,
    );

Map<String, dynamic> _$TimeModelToJson(TimeModel instance) => <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'hour': instance.hour,
      'minute': instance.minute,
      'seconds': instance.seconds,
      'milliSeconds': instance.milliSeconds,
      'dateTime': instance.dateTime,
      'date': instance.date,
      'time': instance.time,
      'timeZone': instance.timeZone,
      'dayOfWeek': instance.dayOfWeek,
      'dstActive': instance.dstActive,
    };
