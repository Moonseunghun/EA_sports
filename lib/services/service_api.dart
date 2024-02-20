import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/data.dart';

class ApiService {
  Future<List<Player>> fetchRankers(String apiKey) async {
    final String apiUrl = "https://api.nexon.co.kr/fifaonline4/v1.0/rankers/";


    final response = await http.get(Uri.parse(apiUrl), headers: {
      'x-nxopen-api-key': 'api $apiKey',
      'Accept-Language': 'ko-KR',
    });

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => Player.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rankers');
    }
  }

}
