import 'package:json_annotation/json_annotation.dart';

part 'battle_list_model.g.dart';

@JsonSerializable()
class BattleListModel {
  final String battleTime;
  final BattleResult battle;
  final Event event;

  BattleListModel({
    required this.battleTime,
    required this.battle,
    required this.event,
  });

  factory BattleListModel.fromJson(Map<String, dynamic> json) =>
      _$BattleListModelFromJson(json);
}

@JsonSerializable()
class BattleResult {
  final String mode;
  final String? type;
  final String? result;
  final int? duration;
  final int? trophyChange;
  final PlayerInBattle? starPlayer;
  final List<List<PlayerInBattle>> teams;

  BattleResult({
    required this.mode,
    this.type,
    this.result,
    this.duration,
    this.trophyChange,
    this.starPlayer,
    required this.teams,
  });

  factory BattleResult.fromJson(Map<String, dynamic> json) =>
      _$BattleResultFromJson(json);
}

@JsonSerializable()
class Event {
  final int id;
  final String? mode;
  final String? map;

  Event({
    required this.id,
    this.mode,
    this.map,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@JsonSerializable()
class PlayerInBattle {
  final String tag;
  final String name;
  final BrawlerInBattle brawler;

  PlayerInBattle({
    required this.tag,
    required this.name,
    required this.brawler,
  });
  
  factory PlayerInBattle.fromJson(Map<String, dynamic> json)
  => _$PlayerInBattleFromJson(json);
}

@JsonSerializable()
class BrawlerInBattle {
  final int id;
  final String name;
  final int power;
  final int trophies;

  BrawlerInBattle({
    required this.id,
    required this.name,
    required this.power,
    required this.trophies,
  });

  factory BrawlerInBattle.fromJson(Map<String, dynamic> json) =>
      _$BrawlerInBattleFromJson(json);
}
