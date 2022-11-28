import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_detail_state.freezed.dart';

@freezed
class ReviewDetailState with _$ReviewDetailState {
  factory ReviewDetailState({
    required int index,
  }) = _ReviewDetailState;
}
