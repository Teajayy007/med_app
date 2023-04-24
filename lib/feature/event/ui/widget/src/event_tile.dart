import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/core/constants/colors.dart';
import 'package:med_event_app/feature/event/domain/event_model.dart';
import 'package:med_event_app/feature/event/ui/states/event_state.dart';
import 'package:med_event_app/utils/extensions.dart';

///[EventListTile] displays id, medicationName, medicationType, and timeStamp.
class EventListTile extends ConsumerWidget {
  const EventListTile({
    super.key,
    required this.event,
    required this.animation,
    required this.index,
  });

  final EventModel event;

  final int index;

  final Animation<double> animation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      background: Container(
        color: Colors.redAccent,
        child: Align(
          alignment: Alignment.centerRight,
          child: PlatformIconButton(
            icon: const Icon(
              Icons.delete,
              color: AppColor.white,
              size: 20,
            ),
          ),
        ),
      ),
      key: UniqueKey(),
      onDismissed: (right) =>
          ref.read(eventStateNotifierProvider.notifier).delete(event, index),
      child: SizeTransition(
        sizeFactor: animation,
        child: Column(
          children: [
            PlatformListTile(
              leading: Text(event.id.toString()),
              title: Text(event.medication),
              trailing: Text(event.datetime.dateFormat.toString()),
              subtitle: Text(
                event.medicationtype,
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
