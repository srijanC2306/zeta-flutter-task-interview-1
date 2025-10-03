import 'package:dio/dio.dart';

const detailsKey = 'details';
const detailKey = 'detail';
const errorKey = 'error';
const messageKey = 'message';

extension DioErrorExtension on DioException {
  String get toAppError {
    try {
      // Try to extract error message from different response structures
      final dynamic errorData = response?.data;

      if (errorData == null) {
        return _getFallbackMessage();
      }

      // Check for nested error structure: error.details[0].message
      final dynamic message = errorData[errorKey]?[detailsKey]?[0]?[messageKey];
      if (message is String && message.isNotEmpty) {
        return message;
      }

      // Check for simple detail field
      final dynamic detail = errorData[detailKey];
      if (detail is String && detail.isNotEmpty) {
        return detail;
      }

      // Check if response.data is directly a string
      if (errorData is String && errorData.isNotEmpty) {
        return errorData;
      }

      return _getFallbackMessage();
    } catch (e) {
      return _getFallbackMessage();
    }
  }

  String _getFallbackMessage() {
    // Return status message if available
    if (response?.statusMessage != null &&
        response!.statusMessage!.isNotEmpty) {
      return response!.statusMessage!;
    }

    // Return generic message based on status code
    final statusCode = response?.statusCode;
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Authentication required. Please log in again.';
      case 403:
        return "Access denied. You don't have permission.";
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Server error. Please try again later.';
      case 502:
      case 503:
      case 504:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Network error. Please check your connection and try again.';
    }
  }
}
