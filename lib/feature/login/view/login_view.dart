import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/login/view/mixin/login_view_mixin.dart';
import 'package:x_im_v00r01/feature/login/view/widget/UizardTextForm.dart';
import 'package:x_im_v00r01/feature/login/view_model/login_view_model.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/widget/button/custom_login/custom_login_button.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthScale = size.width / 411.43; // Ekran genişliğine göre ölçek
    final heightScale = size.height / 707.43; // Ekran yüksekliğine göre ölçek

    return SafeArea(
      child: First_Design_Login(
        heightScale: heightScale,
        widthScale: widthScale,
        loginViewModel: loginViewModel,
      ),
    );
  }
}

class First_Design_Login extends StatelessWidget {
  const First_Design_Login({
    required this.heightScale,
    required this.widthScale,
    required this.loginViewModel,
    super.key,
  });

  final double heightScale;
  final double widthScale;
  final LoginViewModel loginViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: heightScale * 40),
                child: SizedBox(
                  width: 128 * widthScale,
                  height: 128 * heightScale,
                  child: Assets.images.imgLog2.image(package: 'gen'),
                ),
              ),
              Center(
                child: Container(
                  child: Text(
                    'XDBM Life Stories',
                    style: context.general.textTheme.headlineMedium,
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Text(
                    'Discover inspiring life journey',
                    style: context.general.textTheme.bodySmall,
                  ),
                ),
              ),
              SizedBox(
                height: heightScale * 24,
              ),
              Center(
                child: UizardTextForm(
                  heightScale: heightScale,
                  widthScale: widthScale,
                  label: 'Email',
                  controller: loginViewModel.emailController,
                  obscure: false,
                ),
              ),
              SizedBox(
                height: heightScale * 20,
              ),
              Center(
                child: UizardTextForm(
                  heightScale: heightScale,
                  widthScale: widthScale,
                  label: 'Password',
                  controller: loginViewModel.passwordController,
                  obscure: true,
                ),
              ),
              SizedBox(
                height: heightScale * 8,
              ),
              Center(
                child: SizedBox(
                  width: widthScale * 327,
                  height: heightScale * 13,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(
                        Colors.transparent,
                      ),
                      alignment: Alignment.centerRight,
                      padding: WidgetStateProperty.all(
                        EdgeInsets.zero,
                      ),
                    ),
                    child: Text(
                      'Forgot your password ?',
                      style: context.general.textTheme.labelSmall,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: heightScale * 37,
              ),
              Center(
                child: CustomLoginButton(
                  onOperation: loginViewModel.buttonloading,
                  widthScale: widthScale * 327,
                  heightScale: heightScale * 48,
                  title: 'Login',
                ),
              ),
              SizedBox(
                height: heightScale * 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: widthScale * 141, // Çizginin uzunluğunu ayarla
                      child: const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('or'),
                    ),
                    SizedBox(
                      width: widthScale * 141, // Çizginin uzunluğunu ayarla
                      child: const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heightScale * 16,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Ortalamak için

                  children: [
                    CustomLoginButton(
                      onOperation: loginViewModel.buttonloading,
                      widthScale: widthScale * 157,
                      heightScale: heightScale * 48,
                      title: 'Facebook',
                      icon: Assets.icons.facebook.svg(
                        package: 'gen',
                        width: 25,
                      ),
                    ),
                    SizedBox(width: widthScale * 13),
                    CustomLoginButton(
                      onOperation: loginViewModel.buttonloading,
                      widthScale: widthScale * 157,
                      heightScale: heightScale * 48,
                      title: 'Google',
                      icon: Assets.icons.google.svg(
                        package: 'gen',
                        width: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
