import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/core/constants/colors.dart';
import 'package:med_event_app/feature/event/application/providers.dart';

///[TimePickerWidget] modularizes timestamp selection.
///
///Date and Time picker are implemented differently for iOS and Android platform.
///[PlatformWidgetBuilder] provides the capablity to define seperate functions for different
///Cupertino and Material Apps.
class TimePickerWidget extends ConsumerWidget {
  const TimePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = ref.watch(dateProvider);
    final firstDate = dateTime.subtract(const Duration(days: 10000));
    final lastDate = dateTime.add(const Duration(days: 1));
    return PlatformWidgetBuilder(
      material: (context, _, __) {
        return PlatformIconButton(
          color: AppColor.primary,
          icon: const Icon(
            Icons.alarm,
          ),
          onPressed: () async {
            final newTime = await showTimePicker(
              context: context,
              initialEntryMode: TimePickerEntryMode.input,
              initialTime:
                  TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
            );
            ref.read(timeProvider.notifier).update((state) => state = newTime!);
          },
        );
      },
      cupertino: (context, _, __) {
        return PlatformIconButton(
          icon: const Icon(CupertinoIcons.clock),
          onPressed: () async {
            final DateTime? newDate = await showPlatformDatePicker(
              cupertino: (_, __) =>
                  CupertinoDatePickerData(mode: CupertinoDatePickerMode.time),
              context: context,
              initialDate: dateTime,
              firstDate: firstDate,
              lastDate: lastDate,
            );

            final selectedTime =
                TimeOfDay(hour: newDate!.hour, minute: newDate.minute);
            ref
                .read(timeProvider.notifier)
                .update((state) => state = selectedTime);
          },
        );
      },
    );
  }
}
