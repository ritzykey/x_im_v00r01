import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/login/view/login_view.dart';
import 'package:x_im_v00r01/feature/settings/view_model/settings_view_model.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';
import 'package:x_im_v00r01/product/utility/constans/ColorConstants.dart';

class LoginSignupWidget extends StatelessWidget {
  LoginSignupWidget({
    super.key,
    this.avatarURL,
    this.fullName,
  });

  final String? avatarURL;

  final String? fullName;

  final Supabase supabase = Supabase.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsViewModel(
        operationService:
            ProjectService(ProductStateItems.productNetworkManager),
        userCacheOperation: ProductStateItems.productCache.userCacheOperation,
      ),
      child: Material(
        color:
            context.watch<ProductViewModel>().state.themeMode == ThemeMode.dark
                ? ColorConstants.gray700
                : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: (avatarURL?.isEmpty ?? true)
              ? () {
                  //context.router.push(const LoginRoute());
                  showLoginModal(context);
                }
              : null,
          child: Container(
            height: 80,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 26, // 52/2 = 26 yapıyoruz
                  backgroundColor:
                      context.watch<ProductViewModel>().state.themeMode ==
                              ThemeMode.dark
                          ? ColorConstants.gray500
                          : Colors.grey.shade300,
                  backgroundImage: (avatarURL?.isNotEmpty ?? false)
                      ? NetworkImage(avatarURL!)
                      : null,
                  child: (avatarURL?.isNotEmpty ?? false)
                      ? null // Resim varsa icon koymaya gerek yok
                      : Icon(
                          Icons.person,
                          size: 32,
                          color: Colors.grey.shade500,
                        ),
                ),
                const SizedBox(width: 16),
                if (fullName?.isNotEmpty ?? false)
                  Text(
                    '$fullName',
                    style: context.general.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  )
                else
                  Text(
                    '${'settings.login'.tr()} / ${'settings.register'.tr()}',
                    style: context.general.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                const SizedBox(width: 16),
                if (avatarURL?.isNotEmpty ?? false)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          style: context.general.appTheme.textButtonTheme.style
                              ?.copyWith(
                            textStyle: WidgetStateProperty.all(
                              const TextStyle(
                                color: Colors.red,
                              ), // Wrap the TextStyle in MaterialStateProperty.all
                            ),
                          ),
                          onPressed: () async {
                            // Supabase ile çıkış yapma
                            await supabase.client.auth.signOut();

                            // Çıkış işlemi başarılı olduğunda kullanıcıya bilgi verme
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('snackbar.successfulSignOUT'.tr()),
                              ), // Mesajı güncelledik
                            );
                          },
                          icon: const Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                          ), // Çıkış ikonu
                          label: Text('settings.signOut'.tr()),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
