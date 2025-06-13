import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/discover/view/mixin/discover_view_mixin.dart';
import 'package:x_im_v00r01/feature/discover/view_model/discover_view_model.dart';
import 'package:x_im_v00r01/feature/discover/view_model/state/discover_state.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

@RoutePage()
class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends BaseState<DiscoverView>
    with DiscoverViewMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => discoverViewModel,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10),
                  child: Text(
                    'Discover',
                    style: context.general.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.general.mediaSize.height * 0.4,
                  child: BlocBuilder<DiscoverViewModel, DiscoverState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state.stories == null || state.stories!.isEmpty) {
                        return const Center(child: Text('No stories found.'));
                      }
                      return PageView.builder(
                        itemCount: state.stories!.length,
                        onPageChanged: discoverViewModel.onPageChanged,
                        itemBuilder: (context, index) {
                          final story = state.stories![index];
                          return MainDiscover(
                            title: story.translations[
                                        context.locale.languageCode ?? 'en']
                                    ['title'] as String ??
                                'No Title',
                            photoUrl: story.photoUrl,
                          );
                        },
                      );
                    },
                  ),
                ),
                BlocBuilder<DiscoverViewModel, DiscoverState>(
                  builder: (context, state) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            state.stories?.length ??
                                0, // itemCount from PageView
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: state.currentPage == index ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: state.currentPage == index
                                    ? theme.colorScheme.primary
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const _SectionHeader(title: 'Top Picks For You'),
                _HorizontalImageList(scrollController: topScrollController),
                const _SectionHeader(title: 'Legendary Footballers'),
                BlocBuilder<DiscoverViewModel, DiscoverState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state.legendaryFootballers == null ||
                        state.legendaryFootballers!.isEmpty) {
                      return const Center(
                        child: Text('No legendary footballers found.'),
                      );
                    }
                    return SizedBox(
                      height: 130,
                      child: ListView.builder(
                        controller: bottomScrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.legendaryFootballers!.length,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          final footballer = state.legendaryFootballers![index];
                          return ImageButton(
                            onTap: () {},
                            widthscale: 1.8,
                            imageUrl: footballer.photoUrl,
                            name: footballer.fullName,
                          );
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10),
      child: Text(
        title,
        style: context.general.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _HorizontalImageList extends StatelessWidget {
  const _HorizontalImageList({
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130, // Adjusted height
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return ImageButton(
            onTap: () {},
            // A bit of variation for visual interest
            widthscale: (index % 2 == 0) ? 1.8 : 1.2,
            imagePath: 'asset/images/pexels1.jpg',
          );
        },
      ),
    );
  }
}

class MainDiscover extends StatelessWidget {
  const MainDiscover({
    required this.title,
    required this.photoUrl,
    super.key,
  });

  final String title;
  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.memory(
              base64Decode(photoUrl),
              fit: BoxFit.cover,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.5, 1.0],
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Text(
                title,
                style: context.general.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({
    required this.widthscale,
    required this.onTap,
    this.imagePath,
    this.imageUrl,
    this.name,
    super.key,
  }) : assert(imagePath != null || imageUrl != null);
  final String? imagePath;
  final String? imageUrl;
  final double widthscale;
  final VoidCallback onTap;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              if (imagePath != null)
                Image.asset(
                  imagePath!,
                  height: 120,
                  width: widthscale * 100,
                  fit: BoxFit.cover,
                )
              else
                Image.network(
                  imageUrl!,
                  height: 120,
                  width: widthscale * 100,
                  fit: BoxFit.cover,
                ),
              if (name != null)
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Text(
                    name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
