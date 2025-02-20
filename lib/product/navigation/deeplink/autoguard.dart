import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';

class FirstTimeGuard extends AutoRouteGuard {
  FirstTimeGuard({
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  }) : userCacheOperation = userCacheOperation;

  final HiveCacheOperation<UserCacheModel> userCacheOperation;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {


    var userCache = userCacheOperation.get('1');

    final isFirstTime = userCache?.isFirstTime ?? true;

    if (isFirstTime) {
      userCache = userCacheOperation.get('1');
      print(userCache?.isFirstTime); // İlk defa açıldığı için cache'e atayın
      print(userCacheOperation.getAll());
      router.push(const OnboardingsRoute());
    } else {
      resolver.next(); // Direkt devam et
    }
    print('isFirstTimefinaly: $isFirstTime');
  }
}
