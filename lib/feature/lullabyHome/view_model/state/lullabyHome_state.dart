import 'package:equatable/equatable.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';

final class LullabyHomeState extends Equatable {
  const LullabyHomeState({
    required this.isLoading,
    required this.lulbyModel,
  });

  final bool isLoading;
  final LulbyModel lulbyModel;

  @override
  List<Object?> get props => [isLoading, lulbyModel];

  LullabyHomeState copyWith({bool? isLoading, LulbyModel? lulbyModel}) {
    return LullabyHomeState(
      isLoading: isLoading ?? this.isLoading,
      lulbyModel: lulbyModel ?? this.lulbyModel,
    );
  }
}
