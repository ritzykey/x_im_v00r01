import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/bos_yeniEkranAcmakIcic/model/name_model.dart';

abstract class NameService {
  Future<List<NameModel>> getNameStories();
  Future<List<NameModel>> getLegendaryFootballers();
}

class SupabaseNameService implements NameService {
  SupabaseNameService(this._client);
  final SupabaseClient _client;

  @override
  Future<List<NameModel>> getNameStories() async {
    final response = await _client.from('Name_stories').select();
    return response.map(NameModel.fromJson).toList();
  }

  @override
  Future<List<NameModel>> getLegendaryFootballers() async {
    final response = await _client.from('legendary_footballers').select();
    return response.map(NameModel.fromJson).toList();
  }
}
