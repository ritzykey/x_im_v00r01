import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/favorites/view_model/state/favorites_state.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';

final class FavoritesViewModel extends BaseCubit<FavoritesState> {
  FavoritesViewModel({
    required ProjectOperation operationService,
    required HiveCacheOperation<UserCacheModel> userCacheOperation,
  })  : _projectOperationService = operationService,
        userCacheOperation = userCacheOperation,
        super(const FavoritesState(isLoading: false)) {
    // Load favorites when view model is created
    fetchFavorites();
  }

  final ProjectOperation _projectOperationService;
  final HiveCacheOperation<UserCacheModel> userCacheOperation;
  final _supabase = Supabase.instance.client;

  void changeLoading() {
    emit(state.copyWith(isLoading: state.isLoading));
  }

  Future<void> fetchFavorites() async {
    changeLoading();
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return;

      final response = await _supabase
          .from('favorites')
          .select('story_id, daily_stories(*)')
          .eq('status', 'G')
          .eq('user_id', userId);

      print('Favorites response: $response');
      print('Processing response to story models...');

      final stories = response
          .map((item) {
            final storyData = item['daily_stories'];
            if (storyData == null) return null;
            return StoryModel.fromJson(storyData as Map<String, dynamic>);
          })
          .whereType<StoryModel>()
          .toList();

      print('Converted ${stories.length} stories successfully');
      emit(state.copyWith(favoriteStories: stories));
    } catch (e, stack) {
      print('Error fetching favorites: $e');
      print('Stack trace: $stack');
    } finally {
      changeLoading();
    }
  }

  /* Future<void> toggleFavorite(String storyId) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return;
      final exists = await _supabase
          .from('favorites')
          .select()
          .eq('user_id', userId)
          .eq('story_id', storyId)
          .maybeSingle();

      if (exists != null) {
        // Remove from favorites
        await _supabase
            .from('favorites')
            .delete()
            .eq('user_id', userId)
            .eq('story_id', storyId);
      } else {
        // Add to favorites
        await _supabase.from('favorites').insert({
          'user_id': userId,
          'story_id': storyId,
          'created_at': DateTime.now().toIso8601String(),
        });
      }

      // Refresh favorites list
      await fetchFavorites();
    } catch (e) {
      print('Error toggling favorite: $e');
    }
  } */

  Future<bool> isFavorite(String storyId) async {
    try {
      final response = await _supabase
          .rpc<bool>('is_favorite', params: {'story_id': storyId});
      return response;
    } catch (e) {
      print('Error checking favorite status: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>> toggleFavoriteRPC(String storyId) async {
    try {
      final response = await _supabase.rpc<Map<String, dynamic>>(
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

  void handleError(String message) {
    emit(
      state.copyWith(
        isLoading: false,
        // Add error handling to state if needed
      ),
    );
  }
}
