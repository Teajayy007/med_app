// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EventModel _$$_EventModelFromJson(Map<String, dynamic> json) =>
    _$_EventModel(
      id: json['id'] as int,
      datetime: DateTime.parse(json['datetime'] as String),
      medication: json['medication'] as String,
      medicationtype: json['medicationtype'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_EventModelToJson(_$_EventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'datetime': instance.datetime.toIso8601String(),
      'medication': instance.medication,
      'medicationtype': instance.medicationtype,
      'uid': instance.uid,
    };
