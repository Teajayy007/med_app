import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/core/constants/colors.dart';
import 'package:med_event_app/feature/event/application/providers.dart';

///Displays a date picker dialog for a user to select custom calendar date.
class DatePickerWidget extends ConsumerWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateTime = ref.watch(dateProvider);
    final firstDate = dateTime.subtract(const Duration(days: 10000));
    final lastDate = dateTime.add(const Duration(days: 1));
    return PlatformIconButton(
      icon: const Icon(
        CupertinoIcons.calendar,
        color: AppColor.primary,
      ),
      onPressed: () async {
        final date = await showPlatformDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: firstDate,
          lastDate: lastDate,
        );
        ref.read(dateProvider.notifier).update((state) => state = date!);
      },
    );
  }
}
