import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:path_provider/path_provider.dart';

void main() async {

  final debugName   =  'mathemcial_computation' ; 
  final dir  = await getApplicationDocumentsDirectory() ; 

  final String fileName  =  '${dir.path}/${DateTime.now().millisecondsSinceEpoch}/.xlxs' ; 
  final result = await Isolate.run<Map<String, dynamic>>(() => CustomIsolate().readAndParseJson(fileName), debugName: debugName);
  
  
  

  
}

class CustomIsolate {
 

 Future<Map<String, dynamic>> readAndParseJson(String fileName) async{
  

  final data  = await File(fileName).readAsString();

  final jsonData  =  jsonDecode(data) ;

  return jsonData ; 


}



}

