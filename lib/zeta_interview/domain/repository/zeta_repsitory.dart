import 'package:flutter_test_cases/zeta_interview/data/model/users_dto.dart';
import 'package:flutter_test_cases/zeta_interview/domain/entity/users_entity.dart';

abstract class ZetaRepsitory {
  Future<UserEntity> recentTransactions();
}
