import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('多级联动滚动视图'),),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('多级联动滚动视图'),
            floating: false, // 设置悬浮样式
            flexibleSpace: Image.network(
              "https://img1.baidu.com/it/u=722430420,1974228945&fm=253&fmt=auto&app=138",
              // fit: BoxFit.cover,
            ),
            expandedHeight: 200,
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (ctx, index) => ListTile(title: Text('Item #$index')),
              childCount: 100,
            ),
          ),

        ],
      ),
    );
  }
}

