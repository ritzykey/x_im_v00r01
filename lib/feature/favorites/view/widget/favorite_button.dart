import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_im_v00r01/feature/favorites/view_model/favorites_view_model.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    required this.storyId,
    this.size = 24,
    this.color,
    super.key,
  });

  final String storyId;
  final double size;
  final Color? color;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late final ValueNotifier<bool> _isFavorite;
  late final ValueNotifier<bool> _isLoading;

  @override
  void initState() {
    super.initState();
    _isFavorite = ValueNotifier<bool>(true);
    _isLoading = ValueNotifier<bool>(false);
    //_checkFavoriteStatus();
  }

  @override
  void dispose() {
    _isFavorite.dispose();
    _isLoading.dispose();
    super.dispose();
  }

  Future<void> _checkFavoriteStatus() async {
    final viewModel = context.read<FavoritesViewModel>();
    final isFav = await viewModel.isFavorite(widget.storyId);
    if (mounted) {
      _isFavorite.value = isFav;
    }
  }

  Future<void> _toggleFavorite() async {
    if (_isLoading.value) return;

    _isLoading.value = true;

    final viewModel = context.read<FavoritesViewModel>();
    final result = await viewModel.toggleFavoriteRPC(widget.storyId);

    if (mounted) {
      _isLoading.value = false;
      /* if (result['success'] as bool) {
        _isFavorite.value = result['favorited'] as bool;
      } */
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).iconTheme.color;

    return ValueListenableBuilder<bool>(
      valueListenable: _isLoading,
      builder: (context, isLoading, _) {
        return ValueListenableBuilder<bool>(
          valueListenable: _isFavorite,
          builder: (context, isFavorite, _) {
            return IconButton(
              icon: isLoading
                  ? SizedBox(
                      width: widget.size,
                      height: widget.size,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(color ?? Colors.grey),
                      ),
                    )
                  : Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : color,
                      size: widget.size,
                    ),
              onPressed: _toggleFavorite,
            );
          },
        );
      },
    );
  }
}
