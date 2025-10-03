import 'package:dio/dio.dart';
import 'package:flutter_test_cases/zeta_interview/data/datasource/zeta_datasource.dart';
import 'package:flutter_test_cases/zeta_interview/data/datasource/zeta_datasource_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ZetaDatasourceModule {
  ZetaDatasource  zetaDatasource(@Named('zetaDio') Dio dio) => ZetaDatasourceImpl(dio) ; 
  
}