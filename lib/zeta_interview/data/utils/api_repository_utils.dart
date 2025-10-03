import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test_cases/zeta_interview/data/utils/api_response_codes.dart';
import 'package:flutter_test_cases/zeta_interview/data/utils/extension/dio_error_extension.dart';
import 'package:flutter_test_cases/zeta_interview/domain/utils/failure.dart';

class ApiRepositoryUtils {
  static Future<Failure> handleFailure(
    Object e, [
    StackTrace? stackTrace,
  ]) async {
    try {
      if (e is DioException) {
        if (e.type == DioExceptionType.badResponse) {
          return Failure(
            content: e.toAppError,
            responseCode: ApiRepositoryUtils.getApiResponseCodeFromValue(
              e.response?.statusCode,
            ),
          );
        }
        if (e.type == DioExceptionType.connectionError) {
          if (e is SocketException) {
            return Failure(
              content: e.toAppError,
              responseCode: ApiRepositoryUtils.getApiResponseCodeFromValue(
                e.response?.statusCode,
              ),
            );
          }
          return Failure(
            content: e.toAppError,
            responseCode: ApiRepositoryUtils.getApiResponseCodeFromValue(
              e.response?.statusCode,
            ),
          );
        }
        return Failure(
          content: e.toAppError,
          responseCode: ApiRepositoryUtils.getApiResponseCodeFromValue(
            e.response?.statusCode,
          ),
        );
      }
      return Failure(
        content: e.toString(),
        responseCode: ApiResponseCodes.unknownError,
      );
    } on Exception catch (err) {
      return Failure(
        content: err.toString(),
        responseCode: ApiResponseCodes.unknownError,
      );
    }
  }

  static ApiResponseCodes getApiResponseCodeFromValue(int? value) {
    switch (value) {
      case 404:
        return ApiResponseCodes.notFound;
      case 500:
        return ApiResponseCodes.internalServerError;
      case 503:
        return ApiResponseCodes.serviceUnavailable;
      default:
        return ApiResponseCodes.unknownError;
    }
  }
}
