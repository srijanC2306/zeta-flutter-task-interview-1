import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cases/isolate_practise/custom_isolate.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  late String filePath ; 

  setUp(() async {
    final dir = await getTemporaryDirectory();
     filePath = join(dir.path, 'test.json');

    final file = File(filePath);

    await file.writeAsString(
      jsonEncode({
        {"name": "srijan", "role": "Dev"},
      }),
    );
  });

  test('test isolate computation', () async {
    final result = await Isolate.run<Map<String, dynamic>>(
      () => CustomIsolate().readAndParseJson(filePath),
      debugName: 'test_isolate'
    );

    expect(result["name"], "Srijan") ; 
    expect(result["role"], "Dev") ; 
  });
}
