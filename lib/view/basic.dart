import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/sports_provider.dart';

class PlayersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlayersProvider>(context);
    final players = provider.players;

    print(players);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ranjkers'),
      ),
      body: Center(
        child: players.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final player = players[index];
            return ListTile(
              title: Text('ID: ${player.spId}'),
              subtitle: Text('Position: ${player.spPosition}'),
            );
          },
        ),
      ),
    );
  }
}