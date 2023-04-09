import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyListItem with ChangeNotifier {
  final int userId;
  final int id;
  final String title;
  final String body;

  MyListItem({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  notifyListeners();
}

// List<list> get items{
//   return[..._items]
// }
class MyList with ChangeNotifier {
  List<MyListItem> _items = [];
  List<MyListItem> get items {
    return [..._items];
  }

  MyListItem findId(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> getAndStoreItems() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var data = await http.get(url);
      var posts = json.decode(data.body) as List<dynamic>;

      var Newposts = posts.map((e) {
        return MyListItem(
            userId: e['userId'],
            id: e['id'],
            title: e['title'],
            body: e['body']);
      }).toList();
      // print(posts);
      _items = Newposts;
      notifyListeners();
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
