import 'package:flutter/material.dart';

class ScrollViewPage extends StatelessWidget {
  const ScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 216,
            title: const Text("ScrollView Example"),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 216,
                color: Colors.blue,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.green,
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StockDetailHeaderSortDelegate(
              text: "Stocks",
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 74.0,
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text("$index"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StockDetailHeaderSortDelegate extends SliverPersistentHeaderDelegate {
  final String text;
  StockDetailHeaderSortDelegate({required this.text});

  @override
  double get minExtent => 74;

  @override
  double get maxExtent => 79;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 20),
    );
  }

  @override
  bool shouldRebuild(StockDetailHeaderSortDelegate oldDelegate) {
    return true;
  }
}
