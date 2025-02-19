import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return Scaffold(
            body: const AutoRouter(),
            bottomNavigationBar: NavigationBar(
              indicatorColor: Colors.amber,
              backgroundColor: Colors.black,
              selectedIndex: state.selectedindex ?? 0,
              onDestinationSelected: (index) {
                navigationViewModel.changeTab(index, context.router);
              },
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Badge(child: Icon(Icons.notifications_sharp)),
                  label: 'Notifications',
                ),
                NavigationDestination(
                  icon: Badge(
                    label: Text('2'),
                    child: Icon(Icons.messenger_sharp),
                  ),
                  label: 'Messages',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
