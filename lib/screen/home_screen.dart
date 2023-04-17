import 'package:brawl_api/brawler/component/brawler_card.dart';
import 'package:brawl_api/brawler/provider/brawler_state_notifier.dart';
import 'package:brawl_api/brawler/view/brawler_detail_screen.dart';
import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(brawlerProvider);

    if (data is CursorPaginationLoading) {
      return Center(
        child: const CircularProgressIndicator(),
      );
    } else {
      data as CursorPagination;
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            itemBuilder: (_, index) {
              if(index == 0){
                return ElevatedButton(onPressed: (){
                  ref.read(brawlerProvider.notifier).paginate();
                }, child: Text('새로고침'),);
              }
              final pItem = data.items[index];

              return GestureDetector(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      BrawlerCard(
                          image: Image.asset(
                            'asset/img/brawler/16000000.jpg',
                            width: 50,
                            height: 50,
                          ),
                          name: pItem.name),
                      ...pItem.starPowers.map((e) => Text(e.name)).toList(),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BrawlerDetailScreen(
                        model: pItem,
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.grey,
            ),
            itemCount: data.items.length+1,
          ),
        ),
      );
    }

  }
}
