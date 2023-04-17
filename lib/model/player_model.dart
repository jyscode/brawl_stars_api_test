import 'package:brawl_api/model/brawler_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  final String tag;
  final String name;
  final String nameColor;
  final IconModel icon;
  final int trophies;
  final int highestTrophies;
  final int highestPowerPlayPoints;
  final int expLevel;
  final int expPoints;
  final bool isQualifiedFromChampionshipChallenge;
  final int soloVictories;
  final int duoVictories;
  final int bestRoboRumbleTime;
  final int bestTimeAsBigBrawler;
  final ClubModel club;
  final List<PlayerBrawlersModel> brawlers;

  PlayerModel({
    required this.tag,
    required this.name,
    required this.nameColor,
    required this.icon,
    required this.trophies,
    required this.highestTrophies,
    required this.highestPowerPlayPoints,
    required this.expLevel,
    required this.expPoints,
    required this.isQualifiedFromChampionshipChallenge,
    required this.soloVictories,
    required this.duoVictories,
    required this.bestRoboRumbleTime,
    required this.bestTimeAsBigBrawler,
    required this.club,
    required this.brawlers,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json)
  => _$PlayerModelFromJson(json);
}

@JsonSerializable()
class IconModel {
  final int id;

  IconModel({
    required this.id,
  });

  factory IconModel.fromJson(Map<String, dynamic> json)
  => _$IconModelFromJson(json);
}

@JsonSerializable()
class ClubModel {
  final String tag;
  final String name;

  ClubModel({
    required this.tag,
    required this.name,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json)
  => _$ClubModelFromJson(json);
}

@JsonSerializable()
class PlayerBrawlersModel {
  final int id;
  final String name;
  final int power;
  final int rank;
  final int trophies;
  final int highestTrophies;
  final List<GearModel> gears;
  final List<StarPowerModel> starPowers;
  final List<GadgetsModel> gadgets;

  PlayerBrawlersModel({
    required this.id,
    required this.name,
    required this.power,
    required this.rank,
    required this.trophies,
    required this.highestTrophies,
    required this.gears,
    required this.starPowers,
    required this.gadgets,
  });

  factory PlayerBrawlersModel.fromJson(Map<String, dynamic> json)
  => _$PlayerBrawlersModelFromJson(json);
}

@JsonSerializable()
class GearModel {
  final int id;
  final String name;
  final int level;

  GearModel({
    required this.id,
    required this.name,
    required this.level,
  });

  factory GearModel.fromJson(Map<String, dynamic> json)
  => _$GearModelFromJson(json);

}
