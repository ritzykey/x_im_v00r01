import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:x_im_v00r01/feature/homenew/view_model/state/homenew_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/authenction_operation.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class HomenewViewModel extends BaseCubit<HomenewState> {
  /// [AuthenticationOperation] service
  HomenewViewModel({
    required ProjectOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
    required ScrollController scrollController,
    required PageController pageController,
  })  : _projectOperationService = operationService,
        userCacheOperation = userCacheOperation,
        scrollController = scrollController,
        pageController = pageController,
        super(
          const HomenewState(
            isLoading: false,
            opacity: 0.00001,
          ),
        ) {
    _initScrollListener();
  }

  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;
  final ScrollController scrollController;
  final PageController pageController;
  double scrollOffset = 0;
  final maxHeaderHeight = 400.1;
  final minHeaderHeight = kToolbarHeight;
  double opacity = 0;
  double titleSize = 0;
  int titlemaxline = 3;
  double oldscrolloffset = 0;

  EdgeInsets dynamicPadding = const EdgeInsets.only(left: 8, right: 8, top: 20);

  /// Change loading states
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<bool> fetchUsers() async {
    final response = await _projectOperationService.denemeusers();

    emit(state.copyWith(content: response?.content));

    return true;
  }

  void _initScrollListener() {
    scrollController.addListener(() {
      scrollOffset = scrollController.offset;
      opacity = (scrollOffset <= maxHeaderHeight - minHeaderHeight)
          ? 1 - (scrollOffset / (maxHeaderHeight - minHeaderHeight))
          : 0.001;
      print('listener çalışıyor');
      emit(state.copyWith(opacity: opacity));

      if ((scrollOffset - oldscrolloffset).abs() > 1) {
        if (scrollOffset < oldscrolloffset) {
          if (scrollOffset < maxHeaderHeight / 1.5) {
            oldscrolloffset = 0;
            titlemaxline = 3;
            dynamicPadding = const EdgeInsets.only(left: 8, right: 8, top: 20);

            _animateScroll(0);
          }
        } else if (scrollOffset > 0) {
          if (scrollOffset > maxHeaderHeight / 2) {
            oldscrolloffset = maxHeaderHeight;
            titleSize = scrollOffset / (maxHeaderHeight - minHeaderHeight);
            if (titleSize > 0.8) titleSize = 0.8;
            titlemaxline = 1;
            dynamicPadding = const EdgeInsets.only();

            _animateScroll(maxHeaderHeight);
          }
        }
      }
    });
  }

  void _animateScroll(double target) {
    Timer(const Duration(milliseconds: 400), () {
      scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
      );
    });
  }
}
