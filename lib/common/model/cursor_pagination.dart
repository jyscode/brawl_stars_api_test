import 'package:brawl_api/model/brawler_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination.g.dart';

abstract class CursorPaginationBase {}

class CursorPaginationError extends CursorPaginationBase {
  final String message;

  CursorPaginationError({
    required this.message,
  });
}

class CursorPaginationLoading extends CursorPaginationBase {}

@JsonSerializable(
  genericArgumentFactories: true,
)
class CursorPagination<T> extends CursorPaginationBase {
  final List<T> items;
  final Paging paging;

  CursorPagination({
    required this.items,
    required this.paging,
  });

  CursorPagination<T> copyWith({
    List<T>? items,
    Paging? paging,
  }) {
    return CursorPagination<T>(
      items: items ?? this.items,
      paging: paging ?? this.paging,
    );
  }

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson(json, fromJsonT);
}

// 새로고침 할 떄
class CursorPaginationRefetching<T> extends CursorPagination<T> {
  CursorPaginationRefetching({
    required super.items,
    required super.paging,
  });
}

// 데이터가 있는 상태에서 추가로 데이터 요청
class CursorPaginationFetchingMore<T> extends CursorPagination<T> {
  CursorPaginationFetchingMore({
    required super.items,
    required super.paging,
  });
}

@JsonSerializable()
class Paging {
  final Cursor cursors;

  Paging({
    required this.cursors,
  });

  Paging copyWith({
    Cursor? cursors,
  }) {
    return Paging(
      cursors: cursors ?? this.cursors,
    );
  }

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);
}

@JsonSerializable()
class Cursor {
  final String? after;
  final String? before;

  Cursor({
    this.after,
    this.before,
  });

  Cursor copyWith({
    String? after,
    String? before,
  }) {
    return Cursor(
      after: after ?? this.after,
      before: before ?? this.before,
    );
  }

  factory Cursor.fromJson(Map<String, dynamic> json) => _$CursorFromJson(json);
}
