class Player {
  final int spId;
  final int spPosition;
  final PlayerStatus status;
  final DateTime createDate;

  Player({
    required this.spId,
    required this.spPosition,
    required this.status,
    required this.createDate,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      spId: json['spId'],
      spPosition: json['spPosition'],
      status: PlayerStatus.fromJson(json['status']),
      createDate: DateTime.parse(json['createDate']),
    );
  }
}

class PlayerStatus {
  final int shoot;
  final int effectiveShoot;
  final int assist;
  final int goal;
  final int dribble;
  final int dribbleTry;
  final int dribbleSuccess;
  final int passTry;
  final int passSuccess;
  final int block;
  final int tackle;
  final int matchCount;

  PlayerStatus({
    required this.shoot,
    required this.effectiveShoot,
    required this.assist,
    required this.goal,
    required this.dribble,
    required this.dribbleTry,
    required this.dribbleSuccess,
    required this.passTry,
    required this.passSuccess,
    required this.block,
    required this.tackle,
    required this.matchCount,
  });

  factory PlayerStatus.fromJson(Map<String, dynamic> json) {
    return PlayerStatus(
      shoot: json['shoot'],
      effectiveShoot: json['effectiveShoot'],
      assist: json['assist'],
      goal: json['goal'],
      dribble: json['dribble'],
      dribbleTry: json['dribbleTry'],
      dribbleSuccess: json['dribbleSuccess'],
      passTry: json['passTry'],
      passSuccess: json['passSuccess'],
      block: json['block'],
      tackle: json['tackle'],
      matchCount: json['matchCount'],
    );
  }
}
