import 'package:x_im_v00r01/feature/onboardings/view/onboardings_view.dart';
import 'package:x_im_v00r01/feature/onboardings/view_model/onboardings_view_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

// manage your home view screen
mixin OnboardingsViewMixin on BaseState<OnboardingsView> {
  @override
  late final ProductNetworkManager productNetworkManager;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  late final OnboardingsViewModel onboardingsViewModel;

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    onboardingsViewModel = OnboardingsViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
    );
    
  }
}
