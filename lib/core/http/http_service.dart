import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'http_exception.dart';

abstract class HttpService {
  Future<dynamic> getResponse(Uri uri);
}

class HttpServiceImpl implements HttpService {
  @override
  Future<Object> getResponse(Uri uri) async {
    try {
      final response = await http.get(uri);
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  Object _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = jsonDecode(response.body) as Object;
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw ResourceNotFoundException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }
}
