import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:testproject/screens/ListScreen.dart';
import 'package:provider/provider.dart';
import '../providers/List_provider.dart';

class Homescreen extends StatefulWidget {
  static const routeNmae = '/home';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    // var _isLoading = true;
    final DataList = Provider.of<MyList>(context, listen: false);
    // DataList.getAndStoreItems();
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome!')),
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                  child: const Text(
                    'Fetch Data',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    DataList.getAndStoreItems()
                        // .then((_) {
                        //   setState(() {
                        //     _isLoading = false;
                        //   });
                        // })
                        .catchError((error) {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text('An error occured!'),
                                content: const Text('Something went wrong'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text('Okay'))
                                ],
                              ));
                    });
                    //.then((_) {
                    //   setState(() {
                    //     _isLoading = false;
                    //   });
                    //   if (_isLoading) {
                    //     Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   }
                    Navigator.of(context).pushNamed(ListScreen.routename);
                  }))),
    );
  }
}
