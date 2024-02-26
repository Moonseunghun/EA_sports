import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/data.dart';

class ApiService {
  Future<List<Player>> fetchRankers(String apiKey) async {
    final String apiUrl = "https://open.api.nexon.com/fconline/v1/ranker-stats?matchtype=52&players=%5B%7B%22id%22%3A100167680%2C%22po%22%3A18%7D%5D";
    final String apiKey = 'test_d9c86f8b773a60a728e05c99e19bb773ed00365f08ad2e1d699c02d5df8616bed39cbfd1cd954c6e9a1465f619d14473';

    final response = await http.get(Uri.parse('$apiUrl/ranker-stats?matchtype=52&players=%5B%7B%22id%22%3A100167680%2C%22po%22%3A18%7D%5D'), headers: {
      'x-nxopen-api-key': 'api $apiKey',
      'Accept-Language': 'ko-KR',
    });

    if (response.statusCode == 200) {
      print(response);
      List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => Player.fromJson(json)).toList();
    } else {
      throw Exception('Failed  rankers');
    }
  }

}