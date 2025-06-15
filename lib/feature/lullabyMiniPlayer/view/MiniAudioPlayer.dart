import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/lullabyMiniPlayer/view/mixin/miniAudioPlayer_view_mixin.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';

class MiniAudioPlayer extends StatefulWidget {
  const MiniAudioPlayer({
    super.key,
  });

  @override
  State<MiniAudioPlayer> createState() => _MiniAudioPlayerState();
}

class _MiniAudioPlayerState extends BaseState<MiniAudioPlayer>
    with MiniAudioPlayerMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => miniAudioPlateyViewModel,
      child: SizedBox(
        height: (context.general.mediaSize.height * 0.19) / 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 97, 224),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                // Albüm görseli
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://mutluyasam.com.tr/wp-content/uploads/2022/01/ozguvenli-cocuklar-yetistirmek.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // Şarkı ve sanatçı
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Şarkı Adı',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Sanatçı Adı',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Oynatma Düğmesi
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                  onPressed: () {
                    // Oynat/duraklat fonksiyonu
                    audioService.play(
                      'https://fgtupdhhjcmdoqfrerxj.supabase.co/storage/v1/object/public/lullabies//AtemTutemMen.mp3',
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
