import 'dart:convert';

import 'package:flutter_test_cases/zeta_interview/data/datasource/zeta_datasource.dart';
import 'package:flutter_test_cases/zeta_interview/data/model/users_dto.dart';
import 'package:http/http.dart' as http;

class ZetaDatasourceImpl  implements ZetaDatasource{
  @override
  Future<UsersDto> recentTransactions() async{
        // Api Integration

    try {
      const url = 'https://randomuser.me/api';

      final response = await http.get(Uri.parse(url) );

      final jsonResponse = jsonDecode(response.body);

      final result = UsersDto.fromJson(jsonResponse);

      return result;
    } catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }


}