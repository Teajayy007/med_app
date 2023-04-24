import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/feature/event/ui/states/event_state.dart';
import 'package:med_event_app/feature/event/ui/widget/src/date_picker.dart';
import 'package:med_event_app/feature/event/ui/widget/src/input_field.dart';
import 'package:med_event_app/feature/event/ui/widget/src/time_picker.dart';
import 'package:med_event_app/feature/event/ui/widget/src/time_stamp.dart';

///Displays [AlertDialogs] for when a user clicks the + icon.
class DialogAlertWidget extends ConsumerWidget {
  const DialogAlertWidget({Key? key}) : super(key: key);

  void showResultDialog(
      {required BuildContext context, required VoidCallback onpressed}) {
    showPlatformDialog(
      context: context,
      builder: (_) => PlatformAlertDialog(
        title: const Text('Enter your new medication'),
        content: Column(
          children: [
            const InputFieldWidget(),
            Row(
              children: const [
                Expanded(child: DatePickerWidget()),
                Expanded(child: TimePickerWidget()),
              ],
            ),
            const TimeStampWidget(),
          ],
        ),
        actions: <Widget>[
          PlatformDialogAction(
            key: const Key('cancel'),
            material: (_, __) => MaterialDialogActionData(),
            cupertino: (_, __) => CupertinoDialogActionData(),
            child: PlatformText('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          PlatformDialogAction(
            key: const Key('add'),
            onPressed: onpressed,
            child: PlatformText('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformIconButton(
        onPressed: () => showResultDialog(
              context: context,
              onpressed: () =>
                  ref.read(eventStateNotifierProvider.notifier).addNewEvent(),
            ),
        icon: const Icon(Icons.add));
  }
}
