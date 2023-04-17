// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CursorPagination<T> _$CursorPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CursorPagination<T>(
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
      paging: Paging.fromJson(json['paging'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CursorPaginationToJson<T>(
  CursorPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items.map(toJsonT).toList(),
      'paging': instance.paging,
    };

Paging _$PagingFromJson(Map<String, dynamic> json) => Paging(
      cursors: Cursor.fromJson(json['cursors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'cursors': instance.cursors,
    };

Cursor _$CursorFromJson(Map<String, dynamic> json) => Cursor(
      after: json['after'] as String?,
      before: json['before'] as String?,
    );

Map<String, dynamic> _$CursorToJson(Cursor instance) => <String, dynamic>{
      'after': instance.after,
      'before': instance.before,
    };
