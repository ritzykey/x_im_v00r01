import 'package:core/core.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/feature/lullabyHome/service/lullabyHome_service.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view_model/state/lullabyHome_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';
import 'package:x_im_v00r01/product/state/view_model/audio_state/audio_view_model.dart';

final class LullabyHomeViewModel extends BaseCubit<LullabyHomeState> {
  LullabyHomeViewModel({
    required ProjectOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
    required LullabyHomeService lullabyHomeService,
    required AudioViewModel audioViewModel,
  })  : _projectOperationService = operationService,
        userCacheOperation = userCacheOperation,
        _lullabyHomeService = lullabyHomeService,
        _audioViewModel = audioViewModel,
        super(
          const LullabyHomeState(
            isLoading: false,
            lulbyModel:
                LulbyModel(title: '**** ***', audioURL: '', artist: '*****'),
          ),
        );

  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;
  final LullabyHomeService _lullabyHomeService;
  final AudioViewModel _audioViewModel;

  void changeLoading() {
    emit(state.copyWith(isLoading: state.isLoading));
  }

  void changeLullaby(LulbyModel lullaby) {
    emit(state.copyWith(lulbyModel: lullaby));
  }

  Future<void> getLullaby() async {
    final lullaby = await _lullabyHomeService.getLulbies();
    changeLullaby(lullaby.first);
  }
}
