
import 'package:json_annotation/json_annotation.dart';

part 'brawler_model.g.dart';

@JsonSerializable()
class BrawlerModel {
  final int id;
  final String name;
  final List<StarPowerModel> starPowers;
  final List<GadgetsModel> gadgets;

  BrawlerModel({
    required this.id,
    required this.name,
    required this.starPowers,
    required this.gadgets,
  });

  factory BrawlerModel.fromJson(Map<String, dynamic> json)
  => _$BrawlerModelFromJson(json);

  // factory BrawlerModel.fromJson({
  //   required Map<String, dynamic> json,
  // }) {
  //   return BrawlerModel(
  //     id: json['id'],
  //     name: json['name'],
  //     starPowers: json['starPowers']
  //         .map<StarPowerModel>((x) => StarPowerModel(id: x['id'], name: x['name'])).toList(),
  //     gadgets: json['gadgets']
  //         .map<GadgetsModel>((x) => GadgetsModel(id: x['id'], name: x['name'])).toList(),
  //   );
  // }
}

@JsonSerializable()
class StarPowerModel {
  final int id;
  final String name;

  StarPowerModel({
    required this.id,
    required this.name,
  });

  factory StarPowerModel.fromJson(Map<String, dynamic> json)
  => _$StarPowerModelFromJson(json);
}

@JsonSerializable()
class GadgetsModel {
  final int id;
  final String name;

  GadgetsModel({
    required this.id,
    required this.name,
  });

  factory GadgetsModel.fromJson(Map<String, dynamic> json)
  => _$GadgetsModelFromJson(json);
}
