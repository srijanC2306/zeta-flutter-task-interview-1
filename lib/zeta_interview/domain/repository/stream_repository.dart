import 'package:flutter_test_cases/zeta_interview/data/datasource/utils/enums/app_event.dart';

abstract class StreamRepository {


  Stream<AppEvent> getAppEventStream() ;


  void callAppEvent(AppEvent event) ; 

}