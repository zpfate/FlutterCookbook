import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderWidget extends StatelessWidget {
  const FutureProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureProvider<int>(//外面有一层Center的意思想表达Provider用在那里都行，不一定非要在根布局，当然根布局的范围最广
        initialData: 12,
        create: (context)=> Future.value(42),
        child: FutureProviderChild(),
      ),
    );
  }
}

class FutureProviderChild extends StatelessWidget {
  const FutureProviderChild({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<int>()}');
  }
}