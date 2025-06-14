import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@RoutePage()
class LullabyHomeView extends StatefulWidget {
  const LullabyHomeView({super.key});

  @override
  State<LullabyHomeView> createState() => _LullabyHomeViewState();
}

class _LullabyHomeViewState extends State<LullabyHomeView> {
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
            const _LullabyOfTheDayCard(),
            SizedBox(height: context.sized.normalValue),
            const _CategoryGrid(),
          ],
        ),
      ),
    );
  }
}

class _LullabyOfTheDayCard extends StatelessWidget {
  const _LullabyOfTheDayCard();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.play_circle_fill, size: 40),
                color: Colors.white,
                onPressed: () {},
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 6,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 8),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 16),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white.withOpacity(0.5),
                    thumbColor: Colors.white,
                  ),
                  child: Slider(
                    value: 0.5,
                    onChanged: (value) {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
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
          context.router.replaceNamed('/lullabieslist');
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
