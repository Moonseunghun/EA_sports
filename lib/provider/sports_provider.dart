import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../model/data.dart';
import '../services/service_api.dart';


class PlayersProvider extends ChangeNotifier {
  List<Player> _players = [];
  List<Player> get players => _players;

  final ApiService _apiService = ApiService();

  Future<void> fetchPlayers(String apiKey) async {
    try {
      _players = await _apiService.fetchRankers(apiKey);
      if (kDebugMode) {
        print(_players);
      }
      notifyListeners();
    } catch (e) {
      print('Error fetching players: $e');
    }
  }
}
