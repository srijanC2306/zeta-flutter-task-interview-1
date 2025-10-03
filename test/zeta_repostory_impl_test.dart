import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cases/zeta_interview/data/datasource/zeta_datasource.dart';
import 'package:flutter_test_cases/zeta_interview/data/datasource/zeta_datasource_impl.dart';
import 'package:flutter_test_cases/zeta_interview/data/repository/zeta_repository_impl.dart';
import 'package:flutter_test_cases/zeta_interview/domain/repository/zeta_repsitory.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}



void main() {
  late MockDio mockDio;
  late ZetaDatasourceImpl zetaDatasourceImpl;
  

  setUp(() {
    mockDio = MockDio();
    zetaDatasourceImpl = ZetaDatasourceImpl(mockDio);
  });

  test('should return UserDto when API called is succeed', () async{
    final mockResponseData = {
      "results": [
        {
          "name": {"first": "John", "last": "Doe"},
          "email": "johndoe@test.com",
        },
      ],
    };

    when(
      () => mockDio.get(any(), queryParameters: any(named: 'queryParameters')),
    ).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        data: mockResponseData,
        statusCode: 200,
      ),
    );

    // act

    final result = await zetaDatasourceImpl.recentTransactions(10, 1) ; 


    // assert
    expect(result.results, isNotEmpty) ; 
    expect(result.results.first.email, 'johndoe@test.com') ; 
    verify(()=> result).called(1) ; 
  
  });
}
