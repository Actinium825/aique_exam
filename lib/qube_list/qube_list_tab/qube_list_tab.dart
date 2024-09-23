import 'package:flutter/material.dart';
import 'package:qube_project/main.dart';
import 'package:qube_project/qube_list/step_2/widgets/step_tab_button.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';

class QubeListTab extends StatelessWidget {
  const QubeListTab({
    required this.tabController,
    required this.isLoading,
    super.key,
  });

  final TabController tabController;
  final bool isLoading;

  /// Navigate back to Step 1 when pressing back while on Step 2
  void _onPopInvoked() => tabController.animateTo(0);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(tabBarRadius);
    return AnimatedOpacity(
      duration: kThemeChangeDuration,
      opacity: isLoading ? qubeListTabLoadingOpacity : 1,
      child: Container(
        height: tabBarHeight,
        padding: tabBarPadding,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: borderRadius,
        ),
        child: ListenableBuilder(
          listenable: tabController,
          builder: (_, __) {
            final isStep1 = tabController.index == 0;
            return AbsorbPointer(
              absorbing: isLoading || isStep1,
              child: PopScope(
                canPop: isStep1,
                onPopInvokedWithResult: (_, __) => _onPopInvoked(),
                child: TabBar(
                  splashBorderRadius: borderRadius,
                  controller: tabController,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: borderRadius,
                    gradient: qubeGradient,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    StreamBuilder<int>(
                      stream: appDatabase.qubeItemsCount(),
                      builder: (_, snapshot) => StepTabButton(
                        label: step1Label,
                        countColor: Colors.black.withOpacity(isStep1 ? 1 : unselectedTabOpacity),
                        count: snapshot.data ?? 0,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: !isStep1 ? 1 : unselectedTabOpacity,
                      child: StepTabButton(
                        label: step2Label,
                        count: !isStep1 ? 1 : 0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
