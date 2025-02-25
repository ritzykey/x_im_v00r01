import 'package:auto_route/auto_route.dart';
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
}
