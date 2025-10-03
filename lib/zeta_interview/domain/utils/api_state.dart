

import 'package:flutter_test_cases/zeta_interview/domain/utils/failure.dart';

/// Represents the different states of an API operation.
///
/// This sealed class provides a type-safe way to handle API states using
/// pattern matching. It can represent four distinct states:
/// - [ApiState.initial]: The initial state before any API operation
/// - [ApiState.loading]: When an API operation is in progress
/// - [ApiState.success]: When an API operation completes successfully with data
/// - [ApiState.failure]: When an API operation fails with an error message
///
/// Example usage:
/// ```dart
/// ApiState<User> state = ApiState.loading();
///
/// switch (state) {
///   case ApiStateInitial():
///     // Handle initial state
///   case ApiStateLoading():
///     // Show loading indicator
///   case ApiStateSuccess(data: final user):
///     // Display user data
///   case ApiStateError(error: final message):
///     // Show error message
/// }
/// ```
sealed class ApiState<T> extends Equatable {
  const  ApiState();

  /// Creates an initial state before any API operation.
  const factory ApiState.initial() = ApiStateInitial<T>;

  /// Creates a success state with the provided data.
  ///
  /// [data] The successful result data from the API operation.
  const factory ApiState.success(T data) = ApiStateSuccess<T>;

  /// Creates an error state with the provided error message.
  ///
  /// [error] The error message describing what went wrong.
  const factory ApiState.error(String? error) = ApiStateError<T>;

  /// Creates an error state with the provided failure.
  ///
  /// [failure] The failure object describing what went wrong.
  factory ApiState.failure(Failure failure) = ApiStateError.withFailure;

  /// Creates a loading state indicating an API operation is in progress.
  const factory ApiState.loading() = ApiStateLoading<T>;
}

class Equatable {
  const Equatable();
}

/// Initial state before any API operation.
class ApiStateInitial<T> extends ApiState<T> {
  const ApiStateInitial();

  @override
  List<Object?> get props => [];
}

/// Success state with data from API operation.
class ApiStateSuccess<T> extends ApiState<T> {
  const ApiStateSuccess(this.data);
  final T data;

  @override
  List<Object?> get props => [data];

  /// Creates a copy of this state with optional new data.
  ///
  /// [data] The new data to use. If null, the existing data is kept.
  ApiStateSuccess<T> copyWith({T? data}) => ApiStateSuccess<T>(
    data ?? this.data,
  );
}

/// Error state with error message.
class ApiStateError<T> extends ApiState<T> {
  const ApiStateError(this.error);

  ApiStateError.withFailure(Failure failure) : error = failure.content;
  final String? error;

  @override
  List<Object?> get props => [error];

  /// Creates a copy of this state with optional new error message.
  ///
  /// [error] The new error message to use. If null, the existing error is kept.
  ApiStateError<T> copyWith({String? error}) => ApiStateError<T>(
    error ?? this.error,
  );
}

/// Loading state indicating API operation is in progress.
class ApiStateLoading<T> extends ApiState<T> {
  const ApiStateLoading();

  @override
  List<Object?> get props => [];
}
