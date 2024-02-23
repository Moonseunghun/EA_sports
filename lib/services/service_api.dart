import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../model/data.dart';


class ApiService {

  final String apiUrl = "https://open.api.nexon.com/fconline/v1/id?nickname=%EB%AF%BC%EA%B2%BD%EC%9E%AC";
  final String apiKey = 'test_d9c86f8b773a60a728e05c99e19bb773ed00365f08ad2e1d699c02d5df8616bed39cbfd1cd954c6e9a1465f619d14473';
  Future<List<Player>> fetchRankers(String apiKey) async {


  final response = await http.get(Uri.parse('$apiUrl/id?nickname=%EB%AF%BC%EA%B2%BD%EC%9E%AC'), headers: {
    'x-nxopen-api-key': 'api $apiKey',
    'Accept-Language': 'ko-KR',
  });

  if (response.statusCode == 200) {
    print(response);
    List<dynamic> data = jsonDecode(response.body)['data'];
    print(data);
    return data.map((json) => Player.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load rankers');
  }
}

}
