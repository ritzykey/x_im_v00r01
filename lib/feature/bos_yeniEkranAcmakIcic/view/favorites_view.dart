/* import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/favorites/view/mixin/favorites_view_mixin.dart';
import 'package:x_im_v00r01/feature/favorites/view_model/favorites_view_model.dart';
import 'package:x_im_v00r01/feature/favorites/view_model/state/favorites_state.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

@RoutePage()
class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends BaseState<FavoritesView>
    with FavoritesViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => favoritesViewModel,
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<FavoritesViewModel, FavoritesState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 100,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: const EdgeInsets.symmetric(horizontal: 16),
                      title: Text(
                        'Favorites',
                        style: context.general.textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  // Add your content widgets here
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
 */