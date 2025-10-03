import 'package:dio/dio.dart';
import 'package:flutter_test_cases/zeta_interview/data/interceptor/server_error_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

const _timeOut = Duration(minutes: 1);

@module
abstract class ZetaDioModule {
  Dio _getClient(String baseUrl) => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _timeOut,
      sendTimeout: _timeOut,
      receiveTimeout: _timeOut,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': '',
      },
    ),
  );

  @Environment('staging')
  @Named('zetaDio')
  @Singleton()
  Dio get stagingClient => _getClient('https://randomuser.me/');

  @Environment('dev')
  @Named('zetaDio')
  @Singleton()
  Dio get devClient => _getClient('https://randomuser.me/');

  @Environment('prod')
  @Named('zetaDio')
  @Singleton()
  Dio get prodClient => _getClient('https://randomuser.me/');
}

void registerInterceptor() {
  final dio = GetIt.instance<Dio>(instanceName: 'zetaDio');

  dio.interceptors.clear();

  dio.interceptors.addAll([ServerErrorInterceptor()]);
}
