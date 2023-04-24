import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///[httpProvider] is a simple [Dio] Http request provider
final httpProvider = Provider.autoDispose<Dio>(
  (_) {
    BaseOptions options = BaseOptions(
      baseUrl:
          'https://s3-us-west-2.amazonaws.com/ph-svc-mobile-interview-jyzi2gyja',
    );
    return Dio(options);
  },
);

///[textEditingControllerProvider] stores the value entered in [InputFieldWidget]
final textEditingControllerProvider =
    Provider<TextEditingController>((_) => TextEditingController());

///[formKeyProvider] is used to capture state of form state values.
final formKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///[dateProvider] stores current [DateTime] object.
final dateProvider = StateProvider.autoDispose<DateTime>((_) => DateTime.now());

///[timeProvider]  stores current [TimeOfDay] object.
final timeProvider = StateProvider.autoDispose<TimeOfDay>(
    (_) => TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute));

///[timeStampProvider] is used to combine state from [dateProvider]  and [timeProvider] to create a new selected [DateTime] object.
final timeStampProvider = Provider.autoDispose<DateTime>((ref) {
  final date = ref.watch(dateProvider);
  final time = ref.watch(timeProvider);

  final timeStamp = DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );
  return timeStamp;
});

final animatedKeyProvider = StateProvider<GlobalKey<SliverAnimatedListState>>(
    (_) => GlobalKey<SliverAnimatedListState>());
