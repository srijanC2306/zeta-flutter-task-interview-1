import 'package:dio/dio.dart';

class ServerErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if(response.statusCode !=null && response.statusCode ! >=500 && response.statusCode! <=600){
      throw DioException(requestOptions: response.requestOptions , 
      response: response , 
      type: DioExceptionType.badResponse , 
      error: 'Internal Server Error'
      );
    }
    super.onResponse(response, handler);
  }
}
