import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';
import 'package:x_im_v00r01/product/utility/constans/ColorConstants.dart';

class LoginSignupWidget extends StatelessWidget {
  const LoginSignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:
            context.watch<ProductViewModel>().state.themeMode == ThemeMode.dark
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
              color: context.watch<ProductViewModel>().state.themeMode ==
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
            style: context.general.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
