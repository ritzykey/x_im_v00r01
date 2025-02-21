import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:x_im_v00r01/feature/onboardings/view/onboardings_view.dart';
import 'package:x_im_v00r01/feature/onboardings/view/widget/onboardingpages.dart';
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
      pageController: PageController(),
    );
  }

  final List<OnboardingPage> onboardingPages = [
    OnboardingPage(
      title: '''XDBM'e Hoş Geldiniz! ''',
      description:
          '''Burada ünlü ve başarılı insanların hayatlarından ilham alabilirsiniz.''',
      imageAsset: Assets.lottie.onboardscreen1.lottie(
        package: 'gen',
      ),
      titlePosition: 'top',
    ),
    OnboardingPage(
      title: 'Motivasyonel Tavsiyeler',
      description:
          'Dünyaca ünlü isimlerin deneyimlerini keşfedin ve ilham alın!',
      imageAsset: Assets.lottie.onboardscreen2.lottie(
        package: 'gen',
      ),
      titlePosition: 'bottom',
    ),
    OnboardingPage(
      title: 'Favorilerinizi Kaydedin!',
      description:
          'Sevdiğiniz kişilerin hikayelerini kaydedin ve daha sonra okuyun.',
      imageAsset: Assets.lottie.onboardscreen3.lottie(
        package: 'gen',
      ),
      titlePosition: 'top',
    ),
    OnboardingPage(
      title: 'Hemen Başlayın!',
      description:
          '''Sizi bekleyen binlerce ilham verici hikayeyi keşfetmeye hazır mısınız?''',
      imageAsset: Assets.lottie.onboardscreen4.lottie(
        package: 'gen',
      ),
      titlePosition: 'top',
    ),
  ];
}
