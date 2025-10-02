import 'package:flutter_test_cases/zeta_interview/domain/entity/users_entity.dart';
import 'package:flutter_test_cases/zeta_interview/domain/repository/zeta_repsitory.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecentTransaxtionUseCases {
  final ZetaRepository _zetaRepository;

  const GetRecentTransaxtionUseCases(this._zetaRepository);

  Future<UserEntity> call({int? result, int? pages}) async =>
      _zetaRepository.recentTransactions(result, pages);
}
