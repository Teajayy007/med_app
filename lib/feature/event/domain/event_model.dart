import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

///[EventModel] calls defines a json event data model.
///
///This class also posseses toJson and fromJson factory methods.
@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required int id,
    required DateTime datetime,
    required String medication,
    required String medicationtype,
    required String uid,
  }) = _EventModel;

  factory EventModel.fromJson(Map<String, Object?> json) =>
      _$EventModelFromJson(json);
}
