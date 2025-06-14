import 'package:x_im_v00r01/feature/lullabiesList/view/lullabiesList_view.dart';
import 'package:x_im_v00r01/feature/lullabiesList/view_model/lullabiesList_view_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

mixin LullabiesListViewMixin on BaseState<LullabiesListView> {
  late final ProductNetworkErrorManager productNetworkErrorManager;
  late final LullabiesListViewModel lullabiesListViewModel;

  @override
  void initState() {
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    lullabiesListViewModel = LullabiesListViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
    );
  }
}
