import 'package:auto_route/auto_route.dart';
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
    return BlocProvider(
      create: (context) => discoverViewModel,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 20,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Discover',
                          style: context.general.textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.general.mediaSize.height * 0.45,
                      child: PageView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const MainDiscover();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        controller: topScrollController,
                        itemBuilder: (context, index) {
                          return ImageButton(
                            onTap: () {
                              print('top: $index');
                            },
                            widthscale: index == 0 ? 2 : 1,
                            imagePath: 'asset/images/pexels1.jpg',
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        controller: bottomScrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ImageButton(
                            onTap: () {
                              print('bottom: $index');
                            },
                            widthscale: index == 0 ? 2 : 1,
                            imagePath: 'asset/images/pexels1.jpg',
                          );
                        },
                      ),
                    ),
                  ],
                ),
                BlocSelector<DiscoverViewModel, DiscoverState, int>(
                  selector: (state) {
                    return state.currentPage;
                  },
                  builder: (context, state) {
                    return Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        children: List.generate(
                          discoverPages.length,
                          (index) => Container(
                            margin: const EdgeInsets.all(4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: state == index
                                  ? const Color.fromARGB(255, 179, 134, 2)
                                  : const Color(0xFFC9CCD2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainDiscover extends StatelessWidget {
  const MainDiscover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        top: 20,
        right: 12,
      ),
      child: Material(
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide.none,
            padding: EdgeInsets.zero, // 📌 Fazla boşluğu kaldır!

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.asset(
                  //height: context.general.mediaSize.height * 0.45,
                  'asset/images/pexels1.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({
    required this.imagePath,
    required this.widthscale,
    required this.onTap,
    super.key,
  });
  final String imagePath;
  final double widthscale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          child: GestureDetector(
            onTap: onTap, // 📌 Butona basılınca çalışacak
            child: ClipRRect(
              child: Image.asset(
                imagePath,
                height: 120, // Yükseklik 120 piksel olacak
                width: widthscale * 100, // Genişlik tam genişlikte olacak
                fit: BoxFit.cover, // Resmi kapsayacak şekilde sığdır
              ),
            ),
          ),
        ),
      ],
    );
  }
}
