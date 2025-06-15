import 'package:flutter/material.dart';
import 'package:x_im_v00r01/feature/discover/service/discover_service.dart';
import 'package:x_im_v00r01/feature/discover/view/discover_view.dart';
import 'package:x_im_v00r01/feature/discover/view/widget/discoverpages.dart';
import 'package:x_im_v00r01/feature/discover/view_model/discover_view_model.dart';
import 'package:x_im_v00r01/product/service/login_service.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

// manage your home view screen
mixin DiscoverViewMixin on BaseState<DiscoverView> {
  @override
  late final ProductNetworkManager productNetworkManager;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  late final DiscoverViewModel discoverViewModel;
  final ScrollController topScrollController = ScrollController();
  final ScrollController bottomScrollController = ScrollController();
  final bool _isTopScrolling = false;
  @override
  void initState() {
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    discoverViewModel = DiscoverViewModel(
      operationService: LoginService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
      pageController: PageController(),
      discoverService: SupabaseDiscoverService(supabaseClient),
    );
    discoverViewModel.fetchDailyStories();
    discoverViewModel.fetchLegendaryFootballers();
  }

  final List<Discoverpages> discoverPages = [
    Discoverpages(
      title: 'Discover',
      imageAsset: 'asset/images/pexels1.jpg',
    ),
    Discoverpages(
      title: 'Discover',
      imageAsset: 'asset/images/pexels1.jpg',
    ),
    Discoverpages(
      title: 'Discover',
      imageAsset: 'asset/images/pexels1.jpg',
    ),
    Discoverpages(
      title: 'Discover',
      imageAsset: 'asset/images/pexels1.jpg',
    ),
  ];
}
