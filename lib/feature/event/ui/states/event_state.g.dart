// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventStateNotifierHash() =>
    r'57dbf271f080ede4c819e083d875cc3bef0ab780';

///[EventStateNotifier] manages all state activies for [EventModel] list.
///
///It as annotated with a @[riverpod] to indicate provider generation.
///This provider is then consumed in the UI to update states and perform other events.
///
/// Copied from [EventStateNotifier].
@ProviderFor(EventStateNotifier)
final eventStateNotifierProvider = AutoDisposeAsyncNotifierProvider<
    EventStateNotifier, List<EventModel>>.internal(
  EventStateNotifier.new,
  name: r'eventStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EventStateNotifier = AutoDisposeAsyncNotifier<List<EventModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
