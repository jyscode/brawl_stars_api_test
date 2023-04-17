// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BattleListModel _$BattleListModelFromJson(Map<String, dynamic> json) =>
    BattleListModel(
      battleTime: json['battleTime'] as String,
      battle: BattleResult.fromJson(json['battle'] as Map<String, dynamic>),
      event: Event.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BattleListModelToJson(BattleListModel instance) =>
    <String, dynamic>{
      'battleTime': instance.battleTime,
      'battle': instance.battle,
      'event': instance.event,
    };

BattleResult _$BattleResultFromJson(Map<String, dynamic> json) => BattleResult(
      mode: json['mode'] as String,
      type: json['type'] as String?,
      result: json['result'] as String?,
      duration: json['duration'] as int?,
      trophyChange: json['trophyChange'] as int?,
      starPlayer: json['starPlayer'] == null
          ? null
          : PlayerInBattle.fromJson(json['starPlayer'] as Map<String, dynamic>),
      teams: (json['teams'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => PlayerInBattle.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$BattleResultToJson(BattleResult instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'type': instance.type,
      'result': instance.result,
      'duration': instance.duration,
      'trophyChange': instance.trophyChange,
      'starPlayer': instance.starPlayer,
      'teams': instance.teams,
    };

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as int,
      mode: json['mode'] as String?,
      map: json['map'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'mode': instance.mode,
      'map': instance.map,
    };

PlayerInBattle _$PlayerInBattleFromJson(Map<String, dynamic> json) =>
    PlayerInBattle(
      tag: json['tag'] as String,
      name: json['name'] as String,
      brawler:
          BrawlerInBattle.fromJson(json['brawler'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerInBattleToJson(PlayerInBattle instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'brawler': instance.brawler,
    };

BrawlerInBattle _$BrawlerInBattleFromJson(Map<String, dynamic> json) =>
    BrawlerInBattle(
      id: json['id'] as int,
      name: json['name'] as String,
      power: json['power'] as int,
      trophies: json['trophies'] as int,
    );

Map<String, dynamic> _$BrawlerInBattleToJson(BrawlerInBattle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'power': instance.power,
      'trophies': instance.trophies,
    };
