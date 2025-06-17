import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';
import 'package:x_im_v00r01/product/state/view_model/audio_state/audio_state.dart';

final class AudioViewModel extends BaseCubit<AudioState> {
  AudioViewModel()
      : super(
          const AudioState(
            isLoading: true,
            isPlaying: false,
            duration: Duration(minutes: 3, seconds: 11),
            position: Duration.zero,
            lullaby: [
              LulbyModel(
                audioURL: '',
                title: '**** ****** *****',
                artist: 'Anonim',
              ),
            ],
          ),
        );

  void changeLoading() {
    emit(state.copyWith(isLoading: state.isLoading));
  }

  void changeIsPlaying(bool playerState) {
    emit(state.copyWith(isPlaying: playerState));
  }

  void changeDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }

  void changePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void changeLullaby(List<LulbyModel> lullaby) {
    emit(state.copyWith(lullaby: lullaby));
  }
}
