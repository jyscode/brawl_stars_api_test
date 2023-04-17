import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/model/pagination_params.dart';
import 'package:brawl_api/common/repository/base_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaginationProvider<T, U extends IBasePaginationRepository<T>> extends StateNotifier<CursorPaginationBase> {
  final U repository;

  PaginationProvider({
    required this.repository,
  }) : super(CursorPaginationLoading()){
    paginate();
  }

  Future<void> paginate({
    int fetchCount = 10,
    // 추가로 데이터 가져오기, 기존 데이터 보전
    bool fetchMore = false,
    // true일때 강제로 다시 로딩, 기존 데이터 날림
    bool forceRefetch = false,
  }) async {
    // 5가지 가능성 - state의 상태

    // 1) 상태가 CursorPagination일 때
    // 정상적으로 데이터가 있는 상태
    // 2) 상태가 CursorPaginationLoading일 때
    // 데이터가 로딩중인 상태 - 현재 캐시 없음
    // 3) 상태가 CursorPaginationError일 떄 - 에러가 났을 떄
    // 4) 상태가 CursorPaginationRefetching일 떄
    // 첫번쨰 페이지부터 데이터를 다시 불러올 때
    // 5) 상태가 CursorPaginationFetchMore일 떄
    // 추가 데이터를 paginate 해오라는 요청을 받았을 때
    try {
      // 바로 반환하는 상황
      // 1) after - false ( 기존 상태에서 이미 다음 데이터가 없다는 값을 들고 있다면)
      if (state is CursorPagination && !forceRefetch) {
        final pState = state as CursorPagination;

        if (pState.paging.cursors.after == null) {
          return;
        }
      }

      // 2) 로딩중 - fetchMore: true
      // fetchMore가 아닐때 - 새로고침의 의도가 있다.
      final isLoading = state is CursorPaginationLoading;
      final isRefetching = state is CursorPaginationRefetching;
      final isFetchingMore = state is CursorPaginationFetchingMore;

      if (fetchMore && (isLoading || isRefetching || isFetchingMore)) {
        return;
      }

      PaginationParams paginationParams = PaginationParams(
        limit: fetchCount,
      );

      // fetchMore - 데이터를 더 가져오는 상황
      if (fetchMore) {
        print(state.runtimeType);
        final pState = state as CursorPagination<T>;

        state = CursorPaginationFetchingMore<T>(
          items: pState.items,
          paging: pState.paging,
        );

        paginationParams = paginationParams.copyWith(
          after: pState.paging.cursors.after,
        );
      }
      // 데이터를 처음부터 가져오는 상황
      else {
        // 만약에 데이터가 있는 상황이라면
        // 기존 데이터를 보존한채로 Fetch 요청을 진행
        if (state is CursorPagination && !forceRefetch) {
          final pState = state as CursorPagination<T>;
          state = CursorPaginationRefetching<T>(
            items: pState.items,
            paging: pState.paging,
          );
        } else {
          state = CursorPaginationLoading();
        }
      }

      final resp = await repository.paginate(
        paginationParams: paginationParams,
      );

      if (state is CursorPaginationFetchingMore) {
        final pState = state as CursorPaginationFetchingMore<T>;

        print(pState.items.runtimeType);
        print(resp.items.runtimeType);
        print(resp.runtimeType);

        state = resp.copyWith(
          items: [
            ...pState.items,
            ...resp.items,
          ],
        );
        print('추가: ${state.runtimeType}');
      } else {
        state = resp;
      }
    } catch (e, stack) {
      print(e);
      print(stack);
      state =
          CursorPaginationError(message: '데이터를 가져오지 못했습니다., ${e.toString()}');
    }
  }
}
