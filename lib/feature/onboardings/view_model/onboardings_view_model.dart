import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:x_im_v00r01/feature/onboardings/view_model/state/onboardings_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class OnboardingsViewModel extends BaseCubit<OnboardingsState> {
  /// [ProjectOperation] service
  OnboardingsViewModel({
    required ProjectOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _projectOperationService = operationService,
        userCacheOperation = userCacheOperation,
        super(const OnboardingsState(isLoading: false));

  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void putHive() {
    userCacheOperation.put(
      '1',
      UserCacheModel(
        isFirstTime: false,
        user: LoginResponseModel2(),
      ),
    );
    print(userCacheOperation.getAll());
    print(userCacheOperation.getAll().elementAt(0).isFirstTime);

    return;
  }
}
