import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Counter.dart';
import 'Post.dart';
import 'package:http/http.dart' as http;
import 'RandomGif.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Counter();

    return FutureBuilder<List>(
      future: fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: 30,
              itemBuilder: (context, rowNumber) {
                return Container(
                  padding: EdgeInsets.all(2.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new RandomGif(),
                      new Text(
                        snapshot.data[rowNumber].title,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      new Divider(color: Colors.blue)
                    ],
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner
        return CircularProgressIndicator();
      },
    );
  }



  Future<List> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Post> posts = l.map((model) => Post.fromJson(model)).toList();
      return posts;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load posts');
    }
  }

}
