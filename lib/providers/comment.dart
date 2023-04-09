import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'List_provider.dart';

class Comment with ChangeNotifier {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
}

class Comments with ChangeNotifier {
  List<Comment> _items = [];
  List<Comment> get items {
    return [..._items];
  }

  Comment findId(int id) {
    return _items.firstWhere((prod) => prod.postId == id);
  }

  // Fetch Comments
  Future<void> fetchComments(int postId) async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments');
    final response = await http.get(url).catchError((error) {
      print(error);
      throw error;
    });
    var Commentposts = json.decode(response.body) as List<dynamic>;

    var NewComment = Commentposts.map((e) {
      return Comment(
          postId: e['postId'],
          id: e['id'],
          name: e['name'],
          email: e['email'],
          body: e['body']);
    }).toList();
    // print(posts);
    _items = NewComment;
    notifyListeners();
  }

  // @override
  // final list= Provider.of<MyList>(context);
}
