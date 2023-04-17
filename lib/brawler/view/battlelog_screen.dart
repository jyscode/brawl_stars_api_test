import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/model/battle_list_model.dart';
import 'package:brawl_api/player/provider/battle_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BattlelogScreen extends ConsumerStatefulWidget {
  const BattlelogScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<BattlelogScreen> createState() => _BattlelogScreenState();
}

class _BattlelogScreenState extends ConsumerState<BattlelogScreen> {
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
    if (controller.offset > controller.position.maxScrollExtent - 300) {
      ref.read(battleListProvider('%23UYUUQQ8Q').notifier).paginate(
        fetchMore: true,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(battleListProvider('%23UYUUQQ8Q'));

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
    final cp = data as CursorPagination<BattleListModel>;

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
        return Column(
          children: [
            Text(pItem.battleTime),
            Text(pItem.event.mode ?? '없음'),
            Text(pItem.battle.result ?? '없음'),
          ],
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
