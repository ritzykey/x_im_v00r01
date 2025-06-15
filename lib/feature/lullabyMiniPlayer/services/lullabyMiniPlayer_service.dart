import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';

abstract class LullabyMiniPlayerService {
  Future<List<LulbyModel>> getLulbies();
  Future<List<LulbyModel>> getLullabyId(String id);
}

class SupabaseLullabyMiniPlayerService implements LullabyMiniPlayerService {
  SupabaseLullabyMiniPlayerService(this._client);
  final SupabaseClient _client;

  @override
  Future<List<LulbyModel>> getLulbies() async {
    final response = await _client
        .from('lullabies')
        .select()
        .order('created_at', ascending: false);
    return response.map(LulbyModel.fromJson).toList();
  }

  @override
  Future<List<LulbyModel>> getLullabyId(String id) async {
    final response =
        await _client.from('lullabies').select('id, audio_url').eq('id', id);
    return response.map(LulbyModel.fromJson).toList();
  }
}
