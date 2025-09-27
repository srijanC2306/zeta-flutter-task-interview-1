import 'package:flutter_test_cases/zeta_interview/data/model/users_dto.dart';

abstract class ZetaDatasource {

  Future<UsersDto> recentTransactions() ; 
}