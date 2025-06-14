import 'package:core/core.dart';
import 'package:x_im_v00r01/feature/lullabiesList/view_model/state/lullabiesList_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class LullabiesListViewModel extends BaseCubit<LullabiesListState> {
  LullabiesListViewModel({
    required ProjectOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _projectOperationService = operationService,
        userCacheOperation = userCacheOperation,
        super(const LullabiesListState(isLoading: false));

  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;

  void changeLoading() {
    emit(state.copyWith(isLoading: state.isLoading));
  }
}
