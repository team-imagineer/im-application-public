import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  factory MainState({
    required int nowPageIndex,
    required int nowBottomBarIndex,
  }) = _MainState;
}
