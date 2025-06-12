import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:x_im_v00r01/feature/favorites/view/favorites_view.dart';
import 'package:x_im_v00r01/feature/favorites/view_model/favorites_view_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';

mixin FavoritesViewMixin on BaseState<FavoritesView> {
  late final ProductNetworkErrorManager productNetworkErrorManager;
  late final FavoritesViewModel favoritesViewModel;

  @override
  void initState() {
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    favoritesViewModel = FavoritesViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
    );
  }

  Future<void> fetchFavorites() async {
    favoritesViewModel.changeLoading();
    try {
      final userId = supabaseClient.auth.currentUser?.id;
      if (userId == null) return;

      await supabaseClient.rpc<void>(
        'f_set_language',
        params: {
          'p_requested_language': Localizations.localeOf(context).languageCode,
        },
      );

      final response = await supabaseClient
          .from('favorites')
          .select('story_id, daily_stories(*)')
          .eq('status', 'G')
          .eq('user_id', userId) as List;

      print('Favorites response: $response');
      print('Processing response to story models...');

      final stories = response
          .map(
            (item) => StoryModel.fromJson(
              item['daily_stories'] as Map<String, dynamic>,
            ),
          )
          .toList();
      print('Converted $stories stories successfully');

      favoritesViewModel.state.copyWith(favoriteStories: stories);
    } catch (e) {
      // Handle error
      print('Error fetching favorites: $e');
    } finally {
      favoritesViewModel.changeLoading();
    }
  }

  Future<Map<String, dynamic>> toggleFavoriteRPC(String storyId) async {
    try {
      final response = await supabaseClient.rpc<Map<String, dynamic>>(
        'favorite_story',
        params: {'p_story_id': storyId},
      );

      // No need to cast response since we specified the type above
      final typedResponse = response;

      // Refresh favorites list if the operation was successful
      if (typedResponse['success'] as bool) {
        await fetchFavorites();
      }

      return typedResponse;
    } catch (e) {
      print('Error toggling favorite: $e');
      return {
        'success': false,
        'message': 'An error occurred while updating favorites',
      };
    }
  }
}
