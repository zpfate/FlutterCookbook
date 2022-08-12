import 'package:flutter/material.dart';
import 'package:flutter_widgets/tools/tf_app_bar.dart';

import 'key_box.dart';

class KeyPage extends StatefulWidget {
  const KeyPage({Key? key}) : super(key: key);

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  /// Local Key: Value Key  Object Key Unique Key
  /// Global Key
  /// Local Key指的是在当前Widget层级下，有唯一的Key属性，
  /// 而Global Key，则是在全局APP中，具有唯一性。
  /// Global Key的性能会比Local Key差很多。

  /// Value Key，顾名思义，就是使用Value来对Key做标识的Key，
  /// 例如我们在Demo中使用的，ValueKey(1)，value可以是任意类型，这里是1，其实更符合的场景，应该是用Color，或者是更加具有语义性的value来作为Key的value。
  /// Object Key与Value Key类似，但是又不完全一样，Value Key对比的是Value，Value相等，就是相等，而Object Key，对比的是实例，实例相同，才是相等，就好比一个Java中的equals，一个是「==」。我们看下Object Key的源码就一目了然了
  /// Unique Key自己都说了，它是独一无二的，也就是说，Unique Key只和自己相等，任意创建多个Unique Key，都是不相等的，相当于唯一标识了。

  /// Global Key
  /// Global Key全局唯一且只和自己相等，
  /// 还记得之前Element在关联新变化的Widget时是怎么比较Key的吗——Element为了效率问题，只会在当前层级下进行寻找，
  /// 所以，在问题5中，一旦我们修改了某个Widget的层级，那么Element就会消耗重建，
  /// 那么如果使用了Global Key呢？当Key的类型是Global Key时，Element会不惜代价在全局寻找这个Key，这也是为什么Global Key的效率会比较低的原因。

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: "Key Demo"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // KeyBox(color: Colors.green,),
            // KeyBox(color: Colors.yellow,),

            KeyBox(
              color: Colors.green,
              key: ValueKey(1),
            ),
            KeyBox(
              color: Colors.yellow,
              key: ValueKey(2),
            ),
          ],
        ),
      ),
    );
  }
}
