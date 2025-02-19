import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:x_im_v00r01/feature/loading/view_model/state/loading_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class LoadingViewModel extends BaseCubit<LoadingState> {
  /// [ProjectOperation] service
  LoadingViewModel({
    required ProjectOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _projectOperationService = operationService,
        userCacheOperation = userCacheOperation,
        super(const LoadingState(isLoading: false));

  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void loadData() {
    userCacheOperation.put('isFirsTime',
        UserCacheModel(user: LoginResponseModel2(), isFirstTime: false));
  }
}
