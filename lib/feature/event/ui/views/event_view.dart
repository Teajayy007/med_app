import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:med_event_app/feature/event/application/providers.dart';
import 'package:med_event_app/feature/event/ui/states/event_state.dart';
import 'package:med_event_app/feature/event/ui/widget/widgets.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('Medications'),
        trailingActions: const [DialogAlertWidget()],
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final event = ref.watch(eventStateNotifierProvider);
          return event.when(
            data: (data) => PlatformRefreshIndicator(
              onRefresh: () async {
                // return await ref.refresh(eventStateNotifierProvider);
              },
              slivers: [
                SliverAnimatedList(
                  key: ref.read(animatedKeyProvider),
                  initialItemCount: data.length,
                  itemBuilder: (BuildContext context, int index,
                          Animation<double> animation) =>
                      EventListTile(
                    event: data[index],
                    index: index,
                    animation: animation,
                  ),
                ),
              ],
            ),
            error: (err, st) => Center(
              child: Text('$err'),
            ),
            loading: () => Center(
              child: PlatformCircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
