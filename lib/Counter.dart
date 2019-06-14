import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _itemState createState() => _itemState();
}

class _itemState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
            count++;
          }),
      child: Text('Count ${count}'),
    );
  }
}
