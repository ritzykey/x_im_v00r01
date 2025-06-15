import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';

@RoutePage()
class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        LullabyHomeRoute(),
        DiscoverRoute(),
        OnboardingsRoute(),
        FavoritesRoute(),
        SettingsRoute(),
        LullabiesListRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SizedBox(
          height: context.general.mediaSize.height * 0.15,
          child: Column(
            children: [
              SizedBox(
                height: (context.general.mediaSize.height * 0.13) / 2,
                child: Container(
                  color: Colors.black,
                ),
              ),
              SalomonBottomBar(
                key: ValueKey(context.locale),
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  // here we switch between tabs
                  tabsRouter.setActiveIndex(index);
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
            ],
          ),
        );
      },
    );
  }
}
