import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:x_im_v00r01/feature/discover/service/discover_service.dart';
import 'package:x_im_v00r01/feature/discover/view_model/state/discover_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/authenction_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class DiscoverViewModel extends BaseCubit<DiscoverState> {
  /// [AuthenticationOperation] service
  DiscoverViewModel({
    required AuthenticationOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
    required PageController pageController,
    required DiscoverService discoverService,
  })  : _authenticationOperationService = operationService,
        _discoverService = discoverService,
        userCacheOperation = userCacheOperation,
        pageController = pageController,
        super(const DiscoverState(isLoading: false, currentPage: 0));

  final AuthenticationOperation _authenticationOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;
  final PageController pageController;
  final DiscoverService _discoverService;

  /// Change loading state
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> fetchDailyStories() async {
    changeLoading();
    final stories = await _discoverService.getDailyStories();
    emit(state.copyWith(stories: stories));
    changeLoading();
  }

  Future<void> fetchLegendaryFootballers() async {
    changeLoading();
    final footballers = await _discoverService.getLegendaryFootballers();
    emit(state.copyWith(legendaryFootballers: footballers));
    changeLoading();
  }

  Future<bool> fetchUsers() async {
    final response = await _authenticationOperationService.users();

    emit(state.copyWith(users: response));
    return !response.isNotEmpty;
  }

  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
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
}
