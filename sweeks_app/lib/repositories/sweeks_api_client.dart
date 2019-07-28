import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sweeks_app/models/models.dart';

class SweeksApiClient {
  static const baseUrl = 'https://www.sysbird.jp/webapi/?apikey=guest&format=json';

  final http.Client httpClient;

  SweeksApiClient({
    @required this.httpClient
  }) : assert(httpClient != null);

  Future<Torikos> getSweetsWithMax(int max) async {
    final sweetsUrl = '$baseUrl&max=$max';
    final sweetsResponse = await httpClient.get(sweetsUrl);

    if (sweetsResponse.statusCode != 200) {
      throw Exception('${sweetsResponse.body}');
    }

    final jsonResponse = jsonDecode(sweetsResponse.body);
    return Torikos.fromJson(jsonResponse);
  }
}