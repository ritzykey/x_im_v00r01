import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/feature/lullabyHome/service/audio_service.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view/mixin/lullabyHome_view_mixin.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view_model/lullabyHome_view_model.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view_model/state/lullabyHome_state.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/view_model/audio_state/audio_view_model.dart';

@RoutePage()
class LullabyHomeView extends StatefulWidget {
  const LullabyHomeView({super.key});

  @override
  State<LullabyHomeView> createState() => _LullabyHomeViewState();
}

class _LullabyHomeViewState extends BaseState<LullabyHomeView>
    with LullabyHomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => lullabyHomeViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Ninni Dünyası',
            style: context.general.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple.shade700,
            ),
          ),
          centerTitle: false,
          elevation: 0,
          // backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: ListView(
            padding: context.padding.normal,
            children: [
              Container(
                padding: context.padding.medium,
                decoration: BoxDecoration(
                  borderRadius: context.border.normalBorderRadius,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFa18cd1),
                      Color(0xFFfbc2eb),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'lullaby.home.title'.tr(),
                      style: context.general.textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.sized.lowValue),
                    SizedBox(height: context.sized.lowValue),
                    _PlayerRow(audioPlayer: audioService),
                  ],
                ),
              ),
              SizedBox(height: context.sized.normalValue),
              const _CategoryGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayerRow extends StatelessWidget {
  const _PlayerRow({
    required this.audioPlayer,
    super.key,
  });

  final AudioService? audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocSelector<LullabyHomeViewModel, LullabyHomeState, LulbyModel>(
          selector: (state) {
            return state.lulbyModel;
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () async {
                await audioPlayer?.play(state.audioURL).then(
                      (value) =>
                          context.read<AudioViewModel>().changeLullaby([state]),
                    );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white,
                      size: 50,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.title.length > 21
                              ? '${state.title.substring(0, 21)}...'
                              : state.title,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.artist.length > 20
                              ? '${state.artist.substring(0, 20)}...'
                              : state.artist,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: context.padding.low.horizontal,
      mainAxisSpacing: context.padding.low.vertical,
      children: const [
        _CategoryCard(
          icon: Icons.bedtime_outlined,
          title: 'Ninniler',
          color: Color.fromARGB(255, 253, 179, 135),
        ),
        _CategoryCard(
          icon: Icons.book_outlined,
          title: 'Masallar',
          color: Color.fromARGB(255, 252, 134, 154),
        ),
        _CategoryCard(
          icon: Icons.music_note_outlined,
          title: 'Şarkılar',
          color: Color.fromARGB(255, 179, 136, 253),
        ),
        _CategoryCard(
          icon: Icons.mic_none,
          title: 'Kendi Ninnin',
          color: Color.fromARGB(255, 133, 180, 255),
        ),
      ],
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: context.border.normalBorderRadius,
      ),
      shadowColor: Colors.grey.withOpacity(0.3),
      child: InkWell(
        borderRadius: context.border.normalBorderRadius,
        onTap: () {
          context.router.pushNamed('lullabylist');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: context.border.normalBorderRadius,
            gradient: LinearGradient(
              colors: [color, color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              SizedBox(height: context.sized.lowValue),
              Text(
                title,
                style: context.general.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
