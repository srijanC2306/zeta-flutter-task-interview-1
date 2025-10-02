import 'package:dio/dio.dart';
import 'package:flutter_test_cases/zeta_interview/data/datasource/zeta_datasource.dart';
import 'package:flutter_test_cases/zeta_interview/data/model/users_dto.dart';
import 'package:flutter_test_cases/zeta_interview/domain/network_config/network_endpoint.dart';
import 'package:retrofit/retrofit.dart';

part 'zeta_datasource_impl.g.dart';

@RestApi()
abstract class ZetaDatasourceImpl implements ZetaDatasource {
  factory ZetaDatasourceImpl(Dio dio) = _ZetaDatasourceImpl;

  @override
  @GET(NetworkEndpoint.getRandomUser)
  Future<UsersDto> recentTransactions(
    @Query('results') final int? result,
    @Query('page') final int? page,
  );
}
