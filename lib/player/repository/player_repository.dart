import 'package:brawl_api/common/dio/dio.dart';
import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/model/pagination_params.dart';
import 'package:brawl_api/common/repository/base_repository.dart';
import 'package:brawl_api/model/battle_list_model.dart';
import 'package:brawl_api/model/player_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'player_repository.g.dart';

final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final repository = PlayerRepository(dio, baseUrl: 'https://api.brawlstars.com/v1/players');

  return repository;
});

@RestApi()
abstract class PlayerRepository{
  // https://api.brawlstars.com/v1/players
  factory PlayerRepository(Dio dio, {String baseUrl}) = _PlayerRepository;

  @GET('/{tag}')
  @Headers({'accessToken': 'true'})
  Future<PlayerModel> getPlayer({
    @Path() required String tag,
  });

}
