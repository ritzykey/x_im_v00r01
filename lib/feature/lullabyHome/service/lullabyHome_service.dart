import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';

abstract class LullabyHomeService {
  Future<List<LulbyModel>> getLulbies();
}

class SupabaseLullabyHomeService implements LullabyHomeService {
  SupabaseLullabyHomeService(this._client);
  final SupabaseClient _client;

  @override
  Future<List<LulbyModel>> getLulbies() async {
    final response = await _client
        .from('lullabies')
        .select()
        .order('created_at', ascending: false);
    return response.map(LulbyModel.fromJson).toList();
  }
}
