import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/utils/pagination_utils.dart';
import 'package:brawl_api/player/provider/ranking_state_notifier.dart';
import 'package:brawl_api/screen/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RankingScreen extends ConsumerStatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends ConsumerState<RankingScreen> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(scrollListener);
  }

  void scrollListener() {
    // 현재 위치가 최대 길이보다 조금 덜되는 위치까지 왔다면
    // 새로운 데이터를 추가 요청
    PaginationUtils.paginate(
      controller: controller,
      provider: ref.read(rankingProvider.notifier),
    );
    // if (controller.offset > controller.position.maxScrollExtent - 300) {
    //   ref.read(rankingProvider.notifier).paginate(
    //         fetchMore: true,
    //       );
    // }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(rankingProvider);

    // 완전 처음 로딩
    if (data is CursorPaginationLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    // 에러 발생
    if (data is CursorPaginationError) {
      return Center(
        child: Text(data.message),
      );
    }
    final cp = data as CursorPagination;

    return ListView.separated(
      controller: controller,
      itemBuilder: (_, index) {
        if (index == cp.items.length) {
          return Center(
            child: data is CursorPaginationFetchingMore
                ? CircularProgressIndicator()
                : Text('마지막 데이터입니다.'),
          );
        }
        final pItem = cp.items[index];
        return GestureDetector(
          child: Column(
            children: [
              Text(pItem.tag),
              Text(pItem.name),
              Text(pItem.nameColor),
              Text(pItem.rank.toString()),
              Text(pItem.trophies.toString()),
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PlayerScreen(
                  tag: Uri.encodeComponent(pItem.tag),
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 3.0,
          color: Colors.grey,
        );
      },
      itemCount: cp.items.length + 1,
    );
  }
}
