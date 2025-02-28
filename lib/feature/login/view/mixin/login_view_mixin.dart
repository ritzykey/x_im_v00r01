import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/login/view/login_view.dart';
import 'package:x_im_v00r01/feature/login/view_model/login_view_model.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';
import 'package:x_im_v00r01/product/service/login_service.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

mixin LoginViewMixin on BaseState<LoginView> {
  @override
  late final ProductNetworkManager productNetworkManager;

  late final ProductNetworkErrorManager productNetworkErrorManager;

  late final LoginViewModel loginViewModel;

  final Supabase supabase = Supabase.instance;

  @override
  void initState() {
    // TODO: implement activate
    super.initState();

    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    loginViewModel = LoginViewModel(
      operationService: LoginService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
    );
    //_initializeAsyncWork();
  }

  // if (await loginViewModel.tokenCheck()) {
  //   context.router.navigate(const HomenewRoute());
  // }
  Future<void> _initializeAsyncWork() async {
    // Token doğrulama işlemi
    final isValid = await loginViewModel.tokenCheck();

    if (isValid) {
      context.router.navigate(const NavigationRoute());
    }
    // Token geçersizse başka bir sayfaya yönlendirme yapılabilir
    if (!isValid) {
      context.router.navigate(const LoginRoute());
    }
  }

  Future<bool> googleSignIn(BuildContext context) async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId =
        '854580902884-si8t5bml5ebeo5arc56p0fa8lc649hfh.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
    ///
    /// iOS Client ID that you registered with Google Cloud.
    //const iosClientId = 'my-ios.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final googleSignIn = GoogleSignIn(
      // clientId: iosClientId,
      serverClientId: webClientId,
    );

    final googleUser = await googleSignIn.signIn();

    final googleAuth = await googleUser!.authentication;

    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await supabase.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    print('object');
    print('Google sign-in successful');

    context.router.popUntilRoot();

    // SnackBar ile kullanıcıya bilgi verme
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('snackbar.successfulSignIN'.tr())),
    );

    return true;
  }
}
