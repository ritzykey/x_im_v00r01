import 'package:audioplayers/audioplayers.dart';
import 'package:x_im_v00r01/feature/lullabyHome/service/lullabyHome_service.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view/lullabyHome_view.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view_model/lullabyHome_view_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

mixin LullabyHomeViewMixin on BaseState<LullabyHomeView> {
  late final ProductNetworkErrorManager productNetworkErrorManager;
  late final LullabyHomeViewModel lullabyHomeViewModel;

  @override
  void initState() {
    super.initState();

    productNetworkErrorManager = ProductNetworkErrorManager(context);

    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );

    lullabyHomeViewModel = LullabyHomeViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
      lullabyHomeService: SupabaseLullabyHomeService(supabaseClient),
      audioViewModel: ProductStateItems.audioViewModel,
    );

    audioService.onPlayerStateChanged.listen((state) {
      audioViewModel.changeIsPlaying(state == PlayerState.playing);
    });

    audioService.onDurationChanged.listen((newDuration) {
      audioViewModel.changeDuration(newDuration!);
    });

    audioService.onPositionChanged.listen((newPosition) {
      audioViewModel.changePosition(newPosition);
    });

    audioService.onPlayerComplate.listen((event) {
      audioViewModel.changePosition(Duration.zero);
    });

    lullabyHomeViewModel.getLullaby();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    audioService.dispose();
  }
}
