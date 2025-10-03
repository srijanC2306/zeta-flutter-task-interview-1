enum ApiResponseCodes {
  notFound,
  internalServerError,
  unknownError,
  unProcessableEntity,
  serviceUnavailable,
}

extension ApiResponseCodesExt on ApiResponseCodes {
  int get asInt {
    switch (this) {
      case ApiResponseCodes.notFound:
        return 404;
      case ApiResponseCodes.internalServerError:
        return 500;
      case ApiResponseCodes.unknownError:
        return 0;
      case ApiResponseCodes.unProcessableEntity:
        return 422;
      case ApiResponseCodes.serviceUnavailable:
        return 503;
    }
  }
}
