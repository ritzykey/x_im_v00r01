import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:x_im_v00r01/feature/onboardings/view/mixin/onboardings_view_mixin.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

@RoutePage()
class OnboardingsView extends StatefulWidget {
  const OnboardingsView({super.key});

  

  @override
  State<OnboardingsView> createState() => _OnboardingsViewState();
}

class _OnboardingsViewState extends BaseState<OnboardingsView>
    with OnboardingsViewMixin {
  @override
  Widget build(BuildContext context) {
    onboardingsViewModel.putHive();
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            const Text('sashvasdkfjv'),
            LoadingAnimationWidget.twistingDots(
              leftDotColor: const Color(0xFF1A1A3F),
              rightDotColor: const Color(0xFFEA3799),
              size: 200,
            ),
          ],
        ),
      ),
    );
  }
}
