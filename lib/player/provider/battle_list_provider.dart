import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/provider/pagination_provider.dart';
import 'package:brawl_api/model/battle_list_model.dart';
import 'package:brawl_api/player/repository/battle_list_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final battleListProvider =
    StateNotifierProvider.family<BattleListStateNotifier,
CursorPaginationBase, String>(
        (ref, tag){
          final repo = ref.watch(battleListRepositoryProvider(tag));

          return BattleListStateNotifier(repository: repo);
        }
    );

class BattleListStateNotifier extends PaginationProvider<BattleListModel, BattleListRepository> {
  BattleListStateNotifier({
    required super.repository,
  });
}
