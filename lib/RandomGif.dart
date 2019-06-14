import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RandomGif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRandomGif(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String url = snapshot.data;
          return new Container(
            child: new Image.network(url,
                fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
          );
        } else
          return Center();
      },
    );
  }



  Future<String> getRandomGif() async {
    final response = await http.get('https://some-random-api.ml/pikachuimg');

    if (response.statusCode == 200) {
      return json.decode(response.body)['link'];
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load data');
    }
  }
}
