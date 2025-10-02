import 'package:flutter_test_cases/zeta_interview/domain/entity/users_entity.dart';

abstract class ZetaRepository {
  Future<UserEntity> recentTransactions(int? result, int? pages);
}
