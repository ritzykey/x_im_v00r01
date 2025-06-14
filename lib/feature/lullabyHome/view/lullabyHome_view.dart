import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/lullabyHome/service/audio_service.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view/mixin/lullabyHome_view_mixin.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view_model/lullabyHome_view_model.dart';
import 'package:x_im_v00r01/feature/lullabyHome/view_model/state/lullabyHome_state.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

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
    return Scaffold(
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
        backgroundColor: Colors.transparent,
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
                    'Günün Ninnisi',
                    style: context.general.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.sized.lowValue),
                  Text(
                    'Fış Fış Kayıkçı',
                    style: context.general.textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: context.sized.lowValue),
                  BlocProvider(
                    create: (context) => lullabyHomeViewModel,
                    child: _PlayerRow(audioPlayer: audioService),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.sized.normalValue),
            const _CategoryGrid(),
          ],
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
        BlocSelector<LullabyHomeViewModel, LullabyHomeState, bool>(
          selector: (state) {
            return state.isPlaying;
          },
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                state ? Icons.pause_circle_filled : Icons.play_circle_fill,
                size: 40,
              ),
              color: Colors.white,
              onPressed: () async {
                if (state) {
                  await audioPlayer?.pause();
                } else {
                  await audioPlayer?.play(
                    'https://fgtupdhhjcmdoqfrerxj.supabase.co/storage/v1/object/public/lullabies//AtemTutemMen.mp3',
                  );
                }
              },
            );
          },
        ),
        BlocSelector<LullabyHomeViewModel, LullabyHomeState, Duration>(
          selector: (state) {
            return state.position;
          },
          builder: (context, state) {
            String formatDuration(Duration duration) {
              String twoDigits(int n) => n.toString().padLeft(2, '0');
              final minutes = twoDigits(duration.inMinutes.remainder(60));
              final seconds = twoDigits(duration.inSeconds.remainder(60));
              return '$minutes:$seconds';
            }

            return Text(
              formatDuration(state), // Current time
              style: context.general.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
            );
          },
        ),
        BlocSelector<LullabyHomeViewModel, LullabyHomeState,
            (Duration, Duration)>(
          selector: (state) {
            return (state.position, state.duration);
          },
          builder: (context, state) {
            return Expanded(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 6,
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 8,
                  ),
                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 16,
                  ),
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.white.withOpacity(0.5),
                  thumbColor: Colors.white,
                ),
                child: Slider(
                  value: state.$1.inSeconds
                      .toDouble()
                      .clamp(0.0, state.$2.inSeconds.toDouble()),
                  max: state.$2.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer?.seek(position);
                  },
                ),
              ),
            );
          },
        ),
        BlocSelector<LullabyHomeViewModel, LullabyHomeState, Duration>(
          selector: (state) {
            return state.duration;
          },
          builder: (context, state) {
            String formatDuration(Duration duration) {
              String twoDigits(int n) => n.toString().padLeft(2, '0');
              final minutes = twoDigits(duration.inMinutes.remainder(60));
              final seconds = twoDigits(duration.inSeconds.remainder(60));
              return '$minutes:$seconds';
            }

            return Text(
              formatDuration(state), // Total duration
              style: context.general.textTheme.bodyMedium?.copyWith(
                color: Colors.white,
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
          context.router.pushNamed('lullabieslist');
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
