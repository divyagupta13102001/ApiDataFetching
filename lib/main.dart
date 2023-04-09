import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/providers/List_provider.dart';
import 'package:testproject/providers/comment.dart';
import 'package:testproject/screens/ListScreen.dart';
import 'package:testproject/screens/List_detail_screen.dart';
import 'package:testproject/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => MyList()),
        ChangeNotifierProvider(create: (ctx) => Comments())
      ],
      child: MaterialApp(
        title: 'Fetch Data',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
        ),
        home: Homescreen(),
        routes: {
          ListScreen.routename: (ctx) => ListScreen(),
          ListDetailScreeen.routeName: (ctx) => ListDetailScreeen(),
        },
      ),
    );
  }
}
