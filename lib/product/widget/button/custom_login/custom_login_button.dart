import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';
import 'package:x_im_v00r01/product/widget/button/loading_button.dart';
import 'package:x_im_v00r01/product/widget/button/normal_button.dart';

part 'custom_login_button_mixin.dart';

final class CustomLoginButton extends StatefulWidget {
  // ignore: public_member_api_docs
  const CustomLoginButton({
    required this.onOperation,
    required this.widthScale,
    required this.heightScale,
    required this.title,
    this.icon,
    super.key,
  });
  final AsyncValueGetter<bool> onOperation;
  final double widthScale;
  final double heightScale;
  final String title;
  final Widget? icon;

  @override
  State<CustomLoginButton> createState() => _CustomLoginButtonState();
}

class _CustomLoginButtonState extends State<CustomLoginButton>
    with MountedMixin, _CustomLoginButtonMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      builder: (BuildContext context, bool value, Widget? child) {
        if (value) {
          return SizedBox(
            width: widget.widthScale,
            height: widget.heightScale,
            child: LoadingButton(
              onPressed: () {},
            ),
          );
        }
        return SizedBox(
          width: widget.widthScale,
          height: widget.heightScale,
          child: NormalButton(
            title: widget.title,
            icon: widget.icon,
            onPressed: () async {
              await _onPressed(context);
            },
          ),
        );
      },
    );
  }
}
