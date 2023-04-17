import 'package:brawl_api/common/dio/dio.dart';
import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/model/pagination_params.dart';
import 'package:brawl_api/common/repository/base_repository.dart';
import 'package:brawl_api/model/battle_list_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'battle_list_repository.g.dart';

final battleListRepositoryProvider = Provider.family<BattleListRepository, String>((ref, tag){
  final dio = ref.watch(dioProvider);

  return BattleListRepository(dio, baseUrl:'https://api.brawlstars.com/v1/players/$tag/battlelog');
});

// https://api.brawlstars.com/v1/players/:tag/battlelog
@RestApi()
abstract class BattleListRepository implements IBasePaginationRepository<BattleListModel>{
  factory BattleListRepository(Dio dio, {String baseUrl}) =
      _BattleListRepository;

  @override
  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<BattleListModel>> paginate({
   @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}