import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/settings/view/mixin/settings_view_mixin.dart';
import 'package:x_im_v00r01/feature/settings/view_model/settings_view_model.dart';
import 'package:x_im_v00r01/feature/settings/view_model/state/settings_state.dart';
import 'package:x_im_v00r01/product/init/product_localization.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';
import 'package:x_im_v00r01/product/utility/constans/ColorConstants.dart';
import 'package:x_im_v00r01/product/utility/constans/enums/locales.dart';

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
                    'settings.title'.tr(),
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
                        'settings.account.title'.tr(),
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
                              '${'settings.login'.tr()} / ${'settings.register'.tr()}',
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
                        'settings.title'.tr(),
                        style: context.general.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<SettingsViewModel, SettingsState>(
                        builder: (contextAppearance, dynamic) {
                          return _buildListTile(
                            'settings.appearance.title'.tr(),
                            Icons.dark_mode,
                            capitalizeLanguageName(context),
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
                      BlocBuilder<SettingsViewModel, SettingsState>(
                        builder: (contextLanguage, state) {
                          return _buildListTile(
                            'settings.language.title'.tr(),
                            Icons.language,
                            context.locale.languageCode.toUpperCase(),
                            Colors.orange,
                            context.general.appTheme,
                            onTab: () => _showLanguageModal(
                              context,
                              context.general.appTheme,
                              context.locale.languageCode.toUpperCase(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      _buildListTile(
                        'settings.notifications.title'.tr(),
                        Icons.notifications_outlined,
                        '',
                        Colors.blue,
                        context.general.appTheme,
                        onTab: () {},
                      ),
                      const SizedBox(height: 8),
                      _buildListTile(
                        'settings.help'.tr(),
                        Icons.help,
                        '',
                        Colors.green,
                        context.general.appTheme,
                        onTab: () {},
                      ),
                      const SizedBox(height: 8),
                      _buildListTile(
                        'settings.logout'.tr(),
                        Icons.exit_to_app,
                        '',
                        Colors.red,
                        context.general.appTheme,
                        onTab: () {},
                      ),
                    ],
                  ),
                  Text(
                    '${'general.dialog.version.title'.tr()} 1.0.0',
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
              style: context.general.appTheme.textTheme.bodySmall
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

  void _showAppearanceModal(
    BuildContext context,
    ThemeData theme,
    String current,
  ) {
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
                'settings.appearance.showModal'.tr(),
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              ListTile(
                leading: const Icon(
                  Icons.brightness_5,
                  color: Colors.blue,
                ),
                title: Text(
                  'settings.light'.tr(),
                  style: theme.textTheme.bodyMedium,
                ),
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
                title: Text(
                  'settings.dark'.tr(),
                  style: theme.textTheme.bodyMedium,
                ),
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
                title: Text(
                  'settings.system'.tr(),
                  style: theme.textTheme.bodyMedium,
                ),
                onTap: () {
                  context
                      .read<ProductViewModel>()
                      .changeThemeMode(ThemeMode.system);
                  Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.check,
                  color: current == 'System'
                      ? Colors.blueGrey
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
    return;
  }

  void _showLanguageModal(
    BuildContext context,
    ThemeData theme,
    String current,
  ) {
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
                'settings.language.showModal'.tr(),
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              ListTile(
                title: Text('TR', style: theme.textTheme.bodyMedium),
                onTap: () {
                  ProductLocalization.updateLanguage(
                    context: context,
                    value: Locales.tr,
                  );
                  Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.check,
                  color: current == 'TR' ? Colors.blue : Colors.transparent,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text('EN', style: theme.textTheme.bodyMedium),
                onTap: () {
                  ProductLocalization.updateLanguage(
                    context: context,
                    value: Locales.en,
                  );
                  Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.check,
                  color: current == 'EN' ? Colors.blue : Colors.transparent,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(
                  Icons.language,
                  color: Colors.orange,
                ),
                title: Text(
                  'settings.system'.tr(),
                  style: theme.textTheme.bodyMedium,
                ),
                onTap: () {
                  ProductLocalization.updateLanguage(
                    context: context,
                    value: Locales.en,
                  );
                  Navigator.pop(context);
                },
                trailing: Icon(
                  Icons.check,
                  color: current == 'EN' ? Colors.blue : Colors.transparent,
                ),
              ),
            ],
          ),
        );
      },
    );
    return;
  }
}
