import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../ui/service_texts.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;

  const factory Result.error(ApiError e) = Error;
}

enum ApiError {
  networkError,
  codeError,
  authError,
  noDataError,
  serverError,
  requestError,
  userCancel,
  emptyData,
  unknownError;

  String? toErrorMessage() {
    switch (this) {
      case networkError:
        return ServiceTexts.networkError;
      case codeError:
        return ServiceTexts.codeError;
      case authError:
        return ServiceTexts.authError;
      case noDataError:
        return ServiceTexts.noDataError;
      case serverError:
        return ServiceTexts.serverError;
      case unknownError:
        return ServiceTexts.unknownError;
      case userCancel:
        return ServiceTexts.userCancel;
      case emptyData:
        return ServiceTexts.emptyData;
      default:
        return null;
    }
  }
}
