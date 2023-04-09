import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:testproject/providers/List_provider.dart';
import 'package:testproject/providers/comment.dart';

class ListDetailScreeen extends StatelessWidget {
  static const routeName = '/Details';

  @override
  Widget build(BuildContext context) {
    final ListId = ModalRoute.of(context)?.settings.arguments as int;
    final LoadedListItem =
        Provider.of<MyList>(context, listen: false).findId(ListId);
    Provider.of<Comments>(context, listen: false).fetchComments(ListId);
    final loadedComments = Provider.of<Comments>(context);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(LoadedListItem.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
              //   child: Expanded(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            LoadedListItem.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text('Created by User: ${LoadedListItem.userId}')
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FittedBox(child: Text(LoadedListItem.body)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                        child: Text(
                      'Comments',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
                ListView.builder(
                    itemCount: loadedComments.items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                          value: loadedComments.items[i],
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'id: ${loadedComments.items[i].id}\n'
                                        'Name: ${loadedComments.items[i].name}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Email: ${loadedComments.items[i].email}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            'Body: ${loadedComments.items[i].body}')),
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ))
              ]),
          //   ),
          // ),
        ),
      ),
    );
  }
}
