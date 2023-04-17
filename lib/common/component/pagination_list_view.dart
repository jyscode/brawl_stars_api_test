import 'package:brawl_api/common/model/cursor_pagination.dart';
import 'package:brawl_api/common/provider/pagination_provider.dart';
import 'package:brawl_api/common/utils/pagination_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef PaginationWidgetBuilder<T> =
Widget Function(BuildContext context, int index, T model);

class PaginationListView<T> extends ConsumerStatefulWidget {
  final StateNotifierProvider<PaginationProvider, CursorPaginationBase>
      provider;
  final PaginationWidgetBuilder<T> itemBuilder;

  const PaginationListView({
    required this.provider,
    required this.itemBuilder,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<PaginationListView> createState() => _PaginationListViewState<T>();
}

class _PaginationListViewState<T> extends ConsumerState<PaginationListView> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(listener);
  }

  void listener() {
    PaginationUtils.paginate(
      controller: controller,
      provider: ref.read(widget.provider.notifier),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.removeListener(listener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.provider);

    if (state is CursorPaginationLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is CursorPaginationError) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            state.message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(widget.provider.notifier).paginate(
                forceRefetch: true,
              );
            },
            child: Text('다시시도'),
          ),
        ],
      );
    }

    final cp = state as CursorPagination<T>;

    return ListView.separated(
      controller: controller,
      itemBuilder: (_, index) {
        if (index == cp.items.length) {
          return Center(
            child: cp is CursorPaginationFetchingMore
                ? CircularProgressIndicator()
                : Text('마지막 데이터입니다.'),
          );
        }
        final pItem = cp.items[index];
        return widget.itemBuilder(
          context, index, pItem
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
