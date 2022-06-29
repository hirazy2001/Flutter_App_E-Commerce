import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_error.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const Result._();

  const factory Result.success({required T data}) = Success<T>;

  const factory Result.failure({required T err}) = Failure<T>;

  static Result<T> guard<T>(T Function() body) {
    try {
      return Result.success(data: body());
    } on Exception catch (e) {
      return Result.failure(err: AppError(e) as T);
    }
  }

  bool get isSuccess => when(success: (data) => true, failure: (err) => false);

  bool get isFailure => !isSuccess;

  void ifSuccess(Function(T data) body) {
    // maybeWhen(orElse: orElse)
  }
}

extension ResultObjectExt<T> on T {
  Result<T> get asSuccess => Result.success(data: this);

  Result<T> asFailure(Exception e) => Result.failure(err: AppError(e) as T);
}
