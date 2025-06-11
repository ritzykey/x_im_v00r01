import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:x_im_v00r01/feature/navigation/view_model/state/navigation_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';
import 'package:x_im_v00r01/product/service/interface/authenction_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class NavigationViewModel extends BaseCubit<NavigationState> {
  /// [AuthenticationOperation] service
  NavigationViewModel({
    required AuthenticationOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _authenticationOperationService = operationService,
        userCacheOperation = userCacheOperation,
        super(const NavigationState(isLoading: false));

  final AuthenticationOperation _authenticationOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;
  final int selectedindex = 0;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<bool> fetchUsers() async {
    final response = await _authenticationOperationService.users();

    emit(state.copyWith(users: response));
    return !response.isNotEmpty;
  }

  void changeTab(int index, StackRouter router) {
    emit(state.copyWith(selectedindex: index));

    if (index == 0) {
      router.replaceAll([const HomenewRoute()]);
    } else if (index == 1) {
      router.replaceAll([const DiscoverRoute()]);
    } else if (index == 2) {
      router.replaceAll([const OnboardingsRoute()]);
    } else if (index == 3) {
      router.replaceAll([const FavoritesRoute()]);
    } else if (index == 4) {
      router.replaceAll([const SettingsRoute()]);
    }
  }
}
