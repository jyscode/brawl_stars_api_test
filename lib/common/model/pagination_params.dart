

import 'package:json_annotation/json_annotation.dart';

part 'pagination_params.g.dart';

@JsonSerializable()
class PaginationParams {
  final String? after;
  final int? limit;

  const PaginationParams({
    this.after,
    this.limit,
  });

  PaginationParams copyWith({
    String? after,
    int? limit,
  }) {
    return PaginationParams(
      after: after ?? this.after,
      limit: limit ?? this.limit,
    );
  }

  factory PaginationParams.fromJson(Map<String, dynamic> json)
  => _$PaginationParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationParamsToJson(this);
}
