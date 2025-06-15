import 'package:core/core.dart';
import 'package:x_im_v00r01/feature/lullabyHome/service/lullabyHome_service.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view_model/state/lullabyHome_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class LullabyHomeViewModel extends BaseCubit<LullabyHomeState> {
  LullabyHomeViewModel({
    required ProjectOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
    required LullabyHomeService lullabyHomeService,
  })  : _projectOperationService = operationService,
        userCacheOperation = userCacheOperation,
        _lullabyHomeService = lullabyHomeService,
        super(
          const LullabyHomeState(
            isLoading: false,
            isPlaying: false,
            duration: Duration(minutes: 3, seconds: 13),
            position: Duration(minutes: 1, seconds: 5),
          ),
        );

  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;
  final LullabyHomeService _lullabyHomeService;

  void changeLoading() {
    emit(state.copyWith(isLoading: state.isLoading));
  }

  void changeIsPlaying(bool playerState) {
    emit(state.copyWith(isPlaying: playerState));
  }

  void changeDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }

  void changePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  Future<void> getLullaby() async {
    final lullaby = await _lullabyHomeService.getLulbies();
    emit(state.copyWith(lullaby: lullaby));
  }
}
