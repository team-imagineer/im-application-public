import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning.freezed.dart';

@freezed
class Learning with _$Learning {
  factory Learning({
    required String id,
    required Status status,
    required int? score,
    required int? elapsed,
  }) = _Learning;
}

enum Status {
  unTaken,
  onGoing,
  complete,
  unknown;

  static Status fromString(String string) {
    switch (string) {
      case "UNTAKEN":
        return Status.unTaken;
      case "ONGOING":
        return Status.onGoing;
      case "COMPLETE":
        return Status.complete;
      default:
        return unknown;
    }
  }
}
