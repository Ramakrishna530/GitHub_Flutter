import 'dart:convert';
import 'dart:io';

enum JsonFile { repositories, contributors, userDetails }

extension JsonFileExtension on JsonFile {
  String get path {
    var filePath = "test_resources/";
    switch (this) {
      case JsonFile.repositories:
        filePath = '${filePath}repositories.json';
        break;
      case JsonFile.contributors:
        filePath = '${filePath}contributors.json';
        break;
      case JsonFile.userDetails:
        filePath = '${filePath}user_details.json';
    }
    return filePath;
  }
}

Object getMockJson({required String jsonPath}) {
  final file = File(jsonPath);
  final jsonObject = jsonDecode(
    file.readAsStringSync(),
  ) as Object;
  return jsonObject;
}
