import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart'; // 🔥 Provider kütüphanesi
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:x_im_v00r01/product/state/container/index.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

final class StateInitialize extends StatelessWidget {
  const StateInitialize({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(
          value: ProductStateItems.productViewModel,
        ),
        Provider<SupabaseClient>.value(
          value: ProductStateItems.supabaseClient,
        ),
      ],
      child: child,
    );
  }
}
