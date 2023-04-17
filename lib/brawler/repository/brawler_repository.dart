import 'package:brawl_api/common/dio/dio.dart';
import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/model/pagination_params.dart';
import 'package:brawl_api/common/repository/base_repository.dart';
import 'package:brawl_api/model/brawler_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'brawler_repository.g.dart';

final brawlerRepositoryProvider = Provider<BrawlerRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final repository =
      BrawlerRepository(dio, baseUrl: 'https://api.brawlstars.com/v1/brawlers');

  return repository;
});

@RestApi()
abstract class BrawlerRepository
    implements IBasePaginationRepository<BrawlerModel> {
  // https://api.brawlstars.com/v1/brawlers
  factory BrawlerRepository(Dio dio, {String baseUrl}) = _BrawlerRepository;

  @override
  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<BrawlerModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
