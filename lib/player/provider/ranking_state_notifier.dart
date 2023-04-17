import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/model/pagination_params.dart';
import 'package:brawl_api/common/provider/pagination_provider.dart';
import 'package:brawl_api/model/ranking_model.dart';
import 'package:brawl_api/player/repository/ranking_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rankingProvider =
    StateNotifierProvider<RankingStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(rankingRepositoryProvider);
  final notifier = RankingStateNotifier(repository: repository);

  return notifier;
});

class RankingStateNotifier extends PaginationProvider<RankingModel, RankingRepository>{

  RankingStateNotifier({
    required super.repository,
  });

}
