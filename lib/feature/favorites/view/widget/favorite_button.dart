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
  bool _isFavorite = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final viewModel = context.read<FavoritesViewModel>();
    final isFav = await viewModel.isFavorite(widget.storyId);
    if (mounted) {
      setState(() {
        _isFavorite = isFav;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final viewModel = context.read<FavoritesViewModel>();
    final result = await viewModel.toggleFavoriteRPC(widget.storyId);

    if (mounted) {
      setState(() {
        _isLoading = false;
        if (result['success'] as bool) {
          _isFavorite = result['favorited'] as bool;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).iconTheme.color;

    return IconButton(
      icon: _isLoading
          ? SizedBox(
              width: widget.size,
              height: widget.size,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(color ?? Colors.grey),
              ),
            )
          : Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : color,
              size: widget.size,
            ),
      onPressed: _toggleFavorite,
    );
  }
}
