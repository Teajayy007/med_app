import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/feature/event/application/providers.dart';
import 'package:med_event_app/feature/event/application/service.dart';

///Prompts user to enter the name of a medication name.
class InputFieldWidget extends ConsumerWidget {
  const InputFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
        key: ref.read(formKeyProvider),
        child: PlatformTextFormField(
          textAlign: TextAlign.center,
          hintText: 'proair or symbicort',
          autofocus: true,
          controller: ref.read(textEditingControllerProvider),
          validator: ref.read(eventServiceProvider).validateEventName,
        ));
  }
}
