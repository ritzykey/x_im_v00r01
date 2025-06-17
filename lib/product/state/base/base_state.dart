import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/feature/lullabyHome/service/audio_service.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';
import 'package:x_im_v00r01/product/state/view_model/audio_state/audio_view_model.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;

  AudioViewModel get audioViewModel => ProductStateItems.audioViewModel;

  SupabaseClient get supabaseClient => ProductStateItems.supabaseClient;

  AudioService get audioService => ProductStateItems.audioService;
}
