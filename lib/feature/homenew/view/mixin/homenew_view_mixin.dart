import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/homenew/view/homenew_view.dart';
import 'package:x_im_v00r01/feature/homenew/view_model/homenew_view_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

// manage your home view screen
mixin HomenewViewMixin on BaseState<HomenewView> {
  @override
  late final ProductNetworkManager productNetworkManager;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  late final HomenewViewModel homenewViewModel;

  @override
  void initState() {
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    homenewViewModel = HomenewViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
      scrollController: ScrollController(),
      pageController: PageController(),
    );
  }

  double calculateTextHeight(String text, BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: context.general.textTheme.headlineSmall,
      ),
      textDirection: TextDirection.ltr,
      maxLines: 2, // Kaç satır olabileceğini belirle
    )..layout(
        maxWidth: MediaQuery.of(context).size.width - 32,
      ); // Kenar boşluklarını hesaba kat

    return textPainter.height;
  }
}
