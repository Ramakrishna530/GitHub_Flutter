import 'dart:convert';
import 'dart:io';

Object getMockJson({required String jsonPath}) {
  final file = File(jsonPath);
  final jsonObject = jsonDecode(
    file.readAsStringSync(),
  ) as Object;
  return jsonObject;
}
