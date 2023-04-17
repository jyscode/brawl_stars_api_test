// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brawler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrawlerModel _$BrawlerModelFromJson(Map<String, dynamic> json) => BrawlerModel(
      id: json['id'] as int,
      name: json['name'] as String,
      starPowers: (json['starPowers'] as List<dynamic>)
          .map((e) => StarPowerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      gadgets: (json['gadgets'] as List<dynamic>)
          .map((e) => GadgetsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BrawlerModelToJson(BrawlerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'starPowers': instance.starPowers,
      'gadgets': instance.gadgets,
    };

StarPowerModel _$StarPowerModelFromJson(Map<String, dynamic> json) =>
    StarPowerModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$StarPowerModelToJson(StarPowerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

GadgetsModel _$GadgetsModelFromJson(Map<String, dynamic> json) => GadgetsModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GadgetsModelToJson(GadgetsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
