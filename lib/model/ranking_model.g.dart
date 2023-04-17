// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingModel _$RankingModelFromJson(Map<String, dynamic> json) => RankingModel(
      tag: json['tag'] as String,
      name: json['name'] as String,
      nameColor: json['nameColor'] as String,
      trophies: json['trophies'] as int,
      rank: json['rank'] as int,
    );

Map<String, dynamic> _$RankingModelToJson(RankingModel instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'name': instance.name,
      'nameColor': instance.nameColor,
      'trophies': instance.trophies,
      'rank': instance.rank,
    };
