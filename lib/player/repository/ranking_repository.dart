import 'package:brawl_api/common/dio/dio.dart';
import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/model/pagination_params.dart';
import 'package:brawl_api/common/repository/base_repository.dart';
import 'package:brawl_api/model/ranking_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/http.dart';

part 'ranking_repository.g.dart';

final rankingRepositoryProvider = Provider<RankingRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final repository = RankingRepository(dio,
      baseUrl: 'https://api.brawlstars.com/v1/rankings/kr/players');

  return repository;
});

@RestApi()
abstract class RankingRepository implements IBasePaginationRepository<RankingModel>{
  // https://api.brawlstars.com/v1/rankings/kr/players
  factory RankingRepository(Dio dio, {String baseUrl}) = _RankingRepository;

  @override
  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<CursorPagination<RankingModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
