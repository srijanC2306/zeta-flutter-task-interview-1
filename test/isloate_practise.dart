import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cases/isolate_practise/custom_isolate.dart';

void main() {
  late CustomIsolate ci;

  setUp(() {
    ci = CustomIsolate();
  });

  test('test isolate computation', () async{

   final result  =  ci.readAndParseJson('') ; 

    

  });
}
