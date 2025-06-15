import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';

final class MiniAudioPlayerState extends Equatable {
  const MiniAudioPlayerState({
    required this.isLoading,
    required this.lulbyModel,
    this.users,
    this.selectedindex,
  });

  final bool isLoading;
  final List<User>? users;
  final int? selectedindex;
  final LulbyModel lulbyModel;

  @override
  List<Object?> get props => [isLoading, users, selectedindex, lulbyModel];

  MiniAudioPlayerState copyWith({
    bool? isLoading,
    List<User>? users,
    int? selectedindex,
    LulbyModel? lulbyModel,
  }) {
    return MiniAudioPlayerState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      selectedindex: selectedindex ?? this.selectedindex,
      lulbyModel: lulbyModel ?? this.lulbyModel,
    );
  }
}
