import 'package:json_annotation/json_annotation.dart';

part 'ranking_model.g.dart';

@JsonSerializable()
class RankingModel {
  final String tag;
  final String name;
  final String nameColor;
  final int trophies;
  final int rank;

  RankingModel({
    required this.tag,
    required this.name,
    required this.nameColor,
    required this.trophies,
    required this.rank,
  });

  factory RankingModel.fromJson(Map<String, dynamic> json) =>
      _$RankingModelFromJson(json);
}
