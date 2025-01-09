import 'package:flutter/material.dart';
import 'package:x_im_v00r01/feature/signup/view/mixin/signup_view_mixin.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends BaseState<SignupView> with SignupViewMixin {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
