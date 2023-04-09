import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:testproject/screens/List_detail_screen.dart';
import '../providers/List_provider.dart';

class ListData extends StatelessWidget {
  const ListData({super.key});

  @override
  Widget build(BuildContext context) {
    final DataList = Provider.of<MyList>(context);
    // DataList.getAndStoreItems();
    return ListView.builder(
      itemCount: DataList.items.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: DataList.items[i],
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ListDetailScreeen.routeName,
                arguments: DataList.items[i].id);
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        '${DataList.items[i].title}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(),
                Row(
                  children: [
                    Flexible(child: Text('${DataList.items[i].body}')),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
