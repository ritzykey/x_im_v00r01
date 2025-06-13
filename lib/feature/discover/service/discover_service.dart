import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/discover/model/daily_story.dart';
import 'package:x_im_v00r01/feature/discover/model/legendary_footballer.dart';

abstract class DiscoverService {
  Future<List<DailyStory>> getDailyStories();
  Future<List<LegendaryFootballer>> getLegendaryFootballers();
}

class SupabaseDiscoverService implements DiscoverService {
  SupabaseDiscoverService(this._client);
  final SupabaseClient _client;

  @override
  Future<List<DailyStory>> getDailyStories() async {
    final response = await _client.from('daily_stories').select();
    return response.map(DailyStory.fromJson).toList();
  }

  @override
  Future<List<LegendaryFootballer>> getLegendaryFootballers() async {
    final response = await _client.from('legendary_footballers').select();
    return response.map(LegendaryFootballer.fromJson).toList();
  }
}
