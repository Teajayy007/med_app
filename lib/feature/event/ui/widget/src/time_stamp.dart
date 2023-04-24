import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/feature/event/application/providers.dart';

///displays the timestamp selected.
class TimeStampWidget extends ConsumerWidget {
  const TimeStampWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeStampProvider);
    return Column(
      children: [
        const Text('Time Selected: '),
        Text(time.toString()),
      ],
    );
  }
}
