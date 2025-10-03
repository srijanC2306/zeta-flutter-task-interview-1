import 'package:flutter_test_cases/zeta_interview/data/utils/api_response_codes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure({String? content, ApiResponseCodes? responseCode}) =
      _Failure;
      
        @override
        // TODO: implement content
        String? get content => throw UnimplementedError();
      
        @override
        // TODO: implement responseCode
        ApiResponseCodes? get responseCode => throw UnimplementedError();



}
