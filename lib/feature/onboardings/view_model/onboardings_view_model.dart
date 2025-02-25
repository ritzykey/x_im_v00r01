import 'package:core/core.dart';
import 'package:flutter/material.dart';
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
    required PageController pageController,
  })  : _projectOperationService = operationService,
        userCacheOperation = userCacheOperation,
        pageController = pageController,
        super(
          const OnboardingsState(
            isLoading: false,
            currentPage: 0,
            isCompleted: false,
          ),
        );
  final PageController pageController;
  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void nextPage() {
    if (state.currentPage < 4) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  void completeOnboarding() {
    emit(state.copyWith(isCompleted: true));
    onboardingPutHive();
  }

  void onboardingPutHive() {
    //userCacheOperation.remove('isFirstTime'); // Önce eski veriyi sil
    userCacheOperation.put(
      'isFirstTime',
      UserCacheModel(
        user: LoginResponseModel2(),
        isFirstTime: false,
      ),
    );
    final isfirstime = userCacheOperation.get('isFirstTime')?.isFirstTime;
    print('onboardingisfirstime:' '$isfirstime');
  }
}
