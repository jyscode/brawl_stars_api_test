// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) => PlayerModel(
      tag: json['tag'] as String,
      name: json['name'] as String,
      nameColor: json['nameColor'] as String,
      icon: IconModel.fromJson(json['icon'] as Map<String, dynamic>),
      trophies: json['trophies'] as int,
      highestTrophies: json['highestTrophies'] as int,
      highestPowerPlayPoints: json['highestPowerPlayPoints'] as int,
      expLevel: json['expLevel'] as int,
      expPoints: json['expPoints'] as int,
      isQualifiedFromChampionshipChallenge:
          json['isQualifiedFromChampionshipChallenge'] as bool,
      soloVictories: json['soloVictories'] as int,
      duoVictories: json['duoVictories'] as int,
      bestRoboRumbleTime: json['bestRoboRumbleTime'] as int,
      bestTimeAsBigBrawler: json['bestTimeAsBigBrawler'] as int,
      club: ClubModel.fromJson(json['club'] as Map<String, dynamic>),
      brawlers: (json['brawlers'] as List<dynamic>)
          .map((e) => PlayerBrawlersModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerModelToJson(PlayerModel instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'nameColor': instance.nameColor,
      'icon': instance.icon,
      'trophies': instance.trophies,
      'highestTrophies': instance.highestTrophies,
      'highestPowerPlayPoints': instance.highestPowerPlayPoints,
      'expLevel': instance.expLevel,
      'expPoints': instance.expPoints,
      'isQualifiedFromChampionshipChallenge':
          instance.isQualifiedFromChampionshipChallenge,
      'soloVictories': instance.soloVictories,
      'duoVictories': instance.duoVictories,
      'bestRoboRumbleTime': instance.bestRoboRumbleTime,
      'bestTimeAsBigBrawler': instance.bestTimeAsBigBrawler,
      'club': instance.club,
      'brawlers': instance.brawlers,
    };

IconModel _$IconModelFromJson(Map<String, dynamic> json) => IconModel(
      id: json['id'] as int,
    );

Map<String, dynamic> _$IconModelToJson(IconModel instance) => <String, dynamic>{
      'id': instance.id,
    };

ClubModel _$ClubModelFromJson(Map<String, dynamic> json) => ClubModel(
      tag: json['tag'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ClubModelToJson(ClubModel instance) => <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
    };

PlayerBrawlersModel _$PlayerBrawlersModelFromJson(Map<String, dynamic> json) =>
    PlayerBrawlersModel(
      id: json['id'] as int,
      name: json['name'] as String,
      power: json['power'] as int,
      rank: json['rank'] as int,
      trophies: json['trophies'] as int,
      highestTrophies: json['highestTrophies'] as int,
      gears: (json['gears'] as List<dynamic>)
          .map((e) => GearModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      starPowers: (json['starPowers'] as List<dynamic>)
          .map((e) => StarPowerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      gadgets: (json['gadgets'] as List<dynamic>)
          .map((e) => GadgetsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerBrawlersModelToJson(
        PlayerBrawlersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'power': instance.power,
      'rank': instance.rank,
      'trophies': instance.trophies,
      'highestTrophies': instance.highestTrophies,
      'gears': instance.gears,
      'starPowers': instance.starPowers,
      'gadgets': instance.gadgets,
    };

GearModel _$GearModelFromJson(Map<String, dynamic> json) => GearModel(
      id: json['id'] as int,
      name: json['name'] as String,
      level: json['level'] as int,
    );

Map<String, dynamic> _$GearModelToJson(GearModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
    };
