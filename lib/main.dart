import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/sports_provider.dart';
import 'view/basic.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlayersProvider(),
      child: MaterialApp(
        title: 'Rankers App',
        home: PlayersScreen(),
      ),
    );
  }
}

//import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// // 랭커 정보를 담을 모델 클래스
// class Ranker {
//   final String playerId;
//   final String nickname;
//   final int rank;
//
//   Ranker({required this.playerId, required this.nickname, required this.rank});
//
//   factory Ranker.fromJson(Map<String, dynamic> json) {
//     return Ranker(
//       playerId: json['player_id'],
//       nickname: json['nickname'],
//       rank: json['rank'],
//     );
//   }
// }
//
// // API 요청을 보낼 함수
// Future<List<Ranker>> fetchRankers() async {
//   final String apiUrl = "https://api.nexon.co.kr/fifaonline4/v1.0/rankers";
//   final String apiKey = "YOUR_API_KEY_HERE"; // 본인의 API 키로 교체해야 합니다.
//
//   final response = await http.get(Uri.parse(apiUrl), headers: {
//     'x-nxopen-api-key': 'Bearer $apiKey',
//     'Accept-Language': 'ko-KR',
//   });
//
//   if (response.statusCode == 200) {
//     List<dynamic> data = jsonDecode(response.body)['data'];
//     return data.map((json) => Ranker.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load rankers');
//   }
// }
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Rankers App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Rankers'),
//         ),
//         body: Center(
//           child: FutureBuilder<List<Ranker>>(
//             future: fetchRankers(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               } else {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     final ranker = snapshot.data![index];
//                     return ListTile(
//                       title: Text(ranker.nickname),
//                       subtitle: Text('Rank: ${ranker.rank}'),
//                     );
//                   },
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
