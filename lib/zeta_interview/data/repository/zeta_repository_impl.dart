import 'package:flutter_test_cases/zeta_interview/data/datasource/zeta_datasource.dart';
import 'package:flutter_test_cases/zeta_interview/data/model/users_dto.dart';
import 'package:flutter_test_cases/zeta_interview/domain/entity/users_entity.dart';
import 'package:flutter_test_cases/zeta_interview/domain/repository/zeta_repsitory.dart';

class ZetaRepositoryImpl implements ZetaRepsitory {
  final ZetaDatasource zetaDatasource;

  ZetaRepositoryImpl({required this.zetaDatasource});

  @override
  Future<UserEntity> recentTransactions() async {
    try {
      final UsersDto dto = await zetaDatasource.recentTransactions();
      final UserEntity result = dto.toEntity(); 
      return result;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}
