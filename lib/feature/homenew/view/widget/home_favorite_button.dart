import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_im_v00r01/feature/homenew/view_model/homenew_view_model.dart';
import 'package:x_im_v00r01/feature/homenew/view_model/state/homenew_state.dart';

class HomeFavoriteButton extends StatelessWidget {
  const HomeFavoriteButton({
    required this.storyId,
    this.size = 24,
    this.color,
    super.key,
  });

  final String storyId;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomenewViewModel, HomenewState, (bool, bool)>(
      selector: (state) => (
        state.favorites[storyId] ?? false,
        state.isLoadingFavRpc,
      ),
      builder: (context, state) {
        final isFavorite = state.$1;
        print('isLoading: ${state.$2}');
        return TextButton.icon(
          onPressed: state.$2
              ? null
              : () {
                  final viewModel = context.read<HomenewViewModel>();
                  viewModel.toggleFavoriteRPC(storyId);
                },
          iconAlignment: IconAlignment.end,
          icon: state.$2
              ? SizedBox(
                  width: size,
                  height: size,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isFavorite ? Colors.red : (color ?? Colors.grey),
                    ),
                  ),
                )
              : Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: size,
                  color: isFavorite ? Colors.red : color,
                ),
          label: const Text(
            '1664',
          ),
          style: TextButton.styleFrom(
            iconColor: color,
            minimumSize: const Size(0, 32),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            backgroundColor: Theme.of(context).colorScheme.surfaceBright,
          ),
        );
      },
    );
  }
}
