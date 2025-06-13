import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:x_im_v00r01/feature/navigation/view/mixin/navigation_view_mixin.dart';
import 'package:x_im_v00r01/feature/navigation/view_model/Navigation_view_model.dart';
import 'package:x_im_v00r01/feature/navigation/view_model/state/navigation_state.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

@RoutePage()
class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends BaseState<NavigationView>
    with NavigationViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => navigationViewModel,
      child: BlocBuilder<NavigationViewModel, NavigationState>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              navigationViewModel.changeTab(0, context.router);
            },
            child: Scaffold(
              body: const AutoRouter(),
              bottomNavigationBar: SalomonBottomBar(
                key: ValueKey(context.locale),
                currentIndex: state.selectedindex ?? 0,
                onTap: (index) {
                  navigationViewModel.changeTab(index, context.router);
                },
                items: <SalomonBottomBarItem>[
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.home_outlined),
                    title: const Text('bottomNavigation.home').tr(),
                    selectedColor: Colors.blue,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.travel_explore),
                    title: const Text('bottomNavigation.discover').tr(),
                    selectedColor: Colors.teal,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.search),
                    title: const Text('bottomNavigation.search').tr(),
                    selectedColor: Colors.orange,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.favorite),
                    title: const Text('bottomNavigation.favorites').tr(),
                    selectedColor: Colors.pinkAccent,
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.settings_outlined),
                    title: const Text('settings.title').tr(),
                    selectedColor: Colors.cyan,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
