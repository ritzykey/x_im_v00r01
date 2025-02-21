import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/settings/view/mixin/settings_view_mixin.dart';
import 'package:x_im_v00r01/feature/settings/view_model/settings_view_model.dart';
import 'package:x_im_v00r01/feature/settings/view_model/state/settings_state.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';
import 'package:x_im_v00r01/product/utility/constans/ColorConstants.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends BaseState<SettingsView>
    with SettingsViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => settingsViewModel,
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 100,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: const EdgeInsets.symmetric(horizontal: 16),
                  title: Text(
                    'Settings',
                    style: context.general.textTheme.headlineSmall,
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        'Account',
                        style: context.general.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: context
                                      .watch<ProductViewModel>()
                                      .state
                                      .themeMode ==
                                  ThemeMode.dark
                              ? ColorConstants.gray700
                              : Colors.grey.shade200,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context
                                            .watch<ProductViewModel>()
                                            .state
                                            .themeMode ==
                                        ThemeMode.dark
                                    ? ColorConstants.gray500
                                    : Colors.grey.shade300,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.person,
                                  size: 32,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Login / Register',
                              style: context.general.textTheme.titleLarge
                                  ?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Settings',
                        style: context.general.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<SettingsViewModel, SettingsState>(
                        builder: (contextAppearance, dynamic) {
                          return _buildListTile(
                            'Appearance',
                            Icons.dark_mode,
                            capitalizeThemeModeName(context),
                            Colors.purple,
                            context.watch<ProductViewModel>().state.themeMode,
                            onTab: () => _showAppearanceModal(
                              context,
                              context.general.appTheme,
                              capitalizeThemeModeName(context),
                            ),
                          );
                          // return Text(_.theme);
                        },
                      ),
                      const SizedBox(height: 8),
                      _buildListTile(
                        'Language',
                        Icons.language,
                        'EN',
                        Colors.orange,
                        context.general.appTheme,
                        onTab: () {},
                      ),
                      const SizedBox(height: 8),
                      _buildListTile(
                        'Notifications',
                        Icons.notifications_outlined,
                        '',
                        Colors.blue,
                        context.general.appTheme,
                        onTab: () {},
                      ),
                      const SizedBox(height: 8),
                      _buildListTile(
                        'Help',
                        Icons.help,
                        '',
                        Colors.green,
                        context.general.appTheme,
                        onTab: () {},
                      ),
                      const SizedBox(height: 8),
                      _buildListTile(
                        'Logout',
                        Icons.exit_to_app,
                        '',
                        Colors.red,
                        context.general.appTheme,
                        onTab: () {},
                      ),
                    ],
                  ),
                  Text(
                    'Version 1.0.0',
                    style: context.general.appTheme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.grey.shade500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(
    String title,
    IconData icon,
    String trailing,
    Color color,
    theme, {
    VoidCallback? onTab,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        width: 46,
        height: 46,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: color.withAlpha(30)),
        child: Center(
          child: Icon(
            icon,
            color: color,
          ),
        ),
      ),
      title: Text(title, style: context.general.appTheme.textTheme.titleLarge),
      trailing: SizedBox(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              trailing,
              style: context.general.appTheme.textTheme.bodyLarge
                  ?.copyWith(color: Colors.grey.shade600),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
      onTap: onTab,
    );
  }

  _showAppearanceModal(BuildContext context, ThemeData theme, String current) {
    print(current);
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 320,
          decoration: BoxDecoration(
            color: context.watch<ProductViewModel>().state.themeMode ==
                    ThemeMode.dark
                ? Colors.grey.shade900
                : Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a Theme',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(
                  Icons.brightness_5,
                  color: Colors.blue,
                ),
                title: Text('Light', style: theme.textTheme.bodyLarge),
                onTap: () {
                  context
                      .read<ProductViewModel>()
                      .changeThemeMode(ThemeMode.light);
                  Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.check,
                  color: current == 'Light' ? Colors.blue : Colors.transparent,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(
                  Icons.brightness_2,
                  color: Colors.orange,
                ),
                title: Text('Dark', style: theme.textTheme.bodyLarge),
                onTap: () {
                  context
                      .read<ProductViewModel>()
                      .changeThemeMode(ThemeMode.dark);
                  Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.check,
                  color: current == 'Dark' ? Colors.orange : Colors.transparent,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(
                  Icons.brightness_6,
                  color: Colors.blueGrey,
                ),
                title: Text('System', style: theme.textTheme.bodyLarge),
                onTap: () {
                  context
                      .read<ProductViewModel>()
                      .changeThemeMode(ThemeMode.system);
                  Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.check,
                  color: current == 'system'
                      ? Colors.blueGrey
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
