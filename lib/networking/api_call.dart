import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:watchlist_basic/strings.dart';

class Api_call {
  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _response(response);
    } on SocketException {
      throw Exception(Strings.noInternet);
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception(Strings.noData);
    }
    switch (response.statusCode) {
      case 445:
      case 200:

        // var responseJson = json.decode(response.body.toString());
        return response.body;
      case 400:
        throw Exception(response.body.toString());
      case 401:

      case 403:
        throw Exception(response.body.toString());
      case 500:

      default:
        throw Exception(Strings.dataException + '${response.statusCode}');
    }
  }
}
