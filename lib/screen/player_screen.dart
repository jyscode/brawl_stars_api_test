import 'package:brawl_api/model/player_model.dart';
import 'package:brawl_api/player/repository/player_repository.dart';
import 'package:flutter/material.dart';
import 'package:brawl_api/common/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerScreen extends ConsumerWidget {
  final String tag;

  const PlayerScreen({
    required this.tag,
    Key? key,
  }) : super(key: key);

  Future<PlayerModel> getPlayer(WidgetRef ref) async {
    final repository = ref.watch(playerRepositoryProvider);

    return repository.getPlayer(tag: tag);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      title: '플레이어 정보',
      child: FutureBuilder<PlayerModel>(
        future: getPlayer(ref),
        builder: (_, AsyncSnapshot<PlayerModel> snapshot){
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          } else{
            final PlayerModel item = snapshot.data!;
            return SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Text(item.name),
                    Text(item.tag),
                    Text(item.trophies.toString()),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
