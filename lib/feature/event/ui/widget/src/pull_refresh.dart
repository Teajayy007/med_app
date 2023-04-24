import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

///When a custom medication event has be added, we would like to clear the session based on user action.
///
///Hence [PlatformRefreshIndicator] acts as a layer that'll refresh data.
///This action removes custom medication event.(Pull to refresh)
class PlatformRefreshIndicator extends StatelessWidget {
  const PlatformRefreshIndicator({
    required this.slivers,
    required this.onRefresh,
    super.key,
  });

  ///custom list of slivers
  final List<Widget> slivers;

  ///callback when pull to refresh is called
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PlatformWidget(
        material: (_, __) => _buildMaterialSliverList(context),
        cupertino: (_, __) => _buildCupertinoSliverList(context),
      ),
    );
  }

  Widget _buildCupertinoSliverList(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          refreshIndicatorExtent: 10,
          onRefresh: () async => onRefresh(),
          builder: _buildCupertinoRefreshIndicator,
        ),
        ...slivers,
      ],
    );
  }

  Widget _buildMaterialSliverList(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: 50,
      onRefresh: () async => onRefresh(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: slivers,
      ),
    );
  }

  Widget _buildCupertinoRefreshIndicator(
    BuildContext context,
    RefreshIndicatorMode refreshState,
    double pulledExtent,
    double refreshTriggerPullDistance,
    double refreshIndicatorExtent,
  ) {
    return SafeArea(
      child: CupertinoSliverRefreshControl.buildRefreshIndicator(
        context,
        refreshState,
        pulledExtent,
        refreshTriggerPullDistance,
        refreshIndicatorExtent,
      ),
    );
  }
}
