// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Demo"),
        actions: [
          ElevatedButton(onPressed: (){

          }, child: const Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("item$index"),
            subtitle: const Text("subtitle"),
            leading: IconButton(
              icon: const Icon(Icons.telegram),
              onPressed: () {
                debugPrint("tap index == $index");
              },
            ),
            // trailing: CachedNetworkImage(
            //   imageUrl: 'https://avatars.githubusercontent.com/u/38549573?s=200&v=4',
            //   height: 20,
            //   width: 20,
            // ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
