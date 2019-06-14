import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'My deck',
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Hello Flutter'),
          ),
          body: new HomeWidget(),
//          floatingActionButton:
//              new FloatingActionButton(onPressed: () => print('hello'))),
        ));
  }
}
