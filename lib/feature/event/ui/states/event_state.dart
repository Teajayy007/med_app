import 'package:med_event_app/feature/event/application/providers.dart';
import 'package:med_event_app/feature/event/application/service.dart';
import 'package:med_event_app/feature/event/ui/widget/src/event_tile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:med_event_app/feature/event/data/repository/event_repo.dart';
import 'package:med_event_app/feature/event/domain/event_model.dart';

part 'event_state.g.dart';

///[EventStateNotifier] manages all state activies for [EventModel] list.
///
///It as annotated with a @[riverpod] to indicate provider generation.
///This provider is then consumed in the UI to update states and perform other events.
@riverpod
class EventStateNotifier extends _$EventStateNotifier {
  @override
  FutureOr<List<EventModel>> build() async {
    final list =
        await AsyncValue.guard(ref.read(eventRepoProvider).getEventList);

    list.value!.sort((a, b) => b.datetime.compareTo(a.datetime));

    return list.value!;
  }

  ///[addNewEvent] creates a new EventModel that will be added to current state.
  void addNewEvent() {
    //create a new EventModel which will be added to new state list
    final newEvent =
        ref.read(eventServiceProvider).validateForm(id: state.value!.length);

    //updating state
    state = AsyncValue.data([
      newEvent!,
      ...state.value!,
    ]);
  }

  ///Deletes a Model from list
  void delete(EventModel model, int index) {
    final animationKey = ref.read(animatedKeyProvider);

    //delete selected event and update state
    state =
        AsyncValue.data(state.value!.where((e) => e.id != model.id).toList());

    //update builder
    animationKey.currentState?.removeItem(
        index,
        (context, animation) => EventListTile(
              event: model,
              index: index,
              animation: animation,
            ),
        duration: const Duration(milliseconds: 0));
  }
}
