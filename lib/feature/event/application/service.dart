import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/feature/event/application/providers.dart';
import 'package:med_event_app/feature/event/data/repository/event_repo.dart';
import 'package:med_event_app/feature/event/domain/enum/med_type_model.dart';
import 'package:med_event_app/feature/event/domain/event_model.dart';

///[eventServiceProvider] handles validation services
final eventServiceProvider = Provider((ref) => EventValidateService(ref));

class EventValidateService {
  EventValidateService(this._ref);
  final Ref _ref;

  ///validates the form in [InputFieldWidget]
  EventModel? validateForm({required int id}) {
    final formKey = _ref.read(formKeyProvider);
    final textController = _ref.read(textEditingControllerProvider);
    final animationKey = _ref.read(animatedKeyProvider);
    EventModel? model;

    //ensures form is valid before adding to list
    if (formKey.currentState!.validate()) {
      //retrieve the current value of text entered
      final medicationName = textController.text.toLowerCase();
      //create a new EventModel which will be added to new state list
      model = _ref.read(eventRepoProvider).createNewEvent(
          id: id + 1,
          medicationName: medicationName,
          timeStamp: _ref.read(timeStampProvider));

      animationKey.currentState?.insertItem(0);
      //clear text field for new entry
      textController.clear();
    }

    return model;
  }

  ///validates the form in [InputFieldWidget]
  String? validateEventName(String? value) {
    if (value!.trim().isEmpty) {
      return 'empty fields are not allowed';
    }
    if (value.trim() != MedName.proair.name &&
        value.trim() != MedName.symbicort.name) {
      return 'invalid input';
    }
    return null;
  }
}
