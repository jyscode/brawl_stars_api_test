
import 'package:brawl_api/brawler/repository/brawler_repository.dart';
import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brawlerProvider = StateNotifierProvider<BrawlerStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(brawlerRepositoryProvider);
  final notifier = BrawlerStateNotifier(repository: repository);

  return notifier;
});
class BrawlerStateNotifier extends StateNotifier<CursorPaginationBase>{
  final BrawlerRepository repository;
  BrawlerStateNotifier({
    required this.repository,
  }) : super(CursorPaginationLoading()){
    paginate();
  }

  paginate() async{
    final resp = await repository.paginate();

    state = resp;
  }

}