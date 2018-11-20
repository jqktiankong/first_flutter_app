import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new ParentPage(),
    );
  }
}

class ParentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ParentPageState();
  }
}

class _ParentPageState extends State<ParentPage> {
  ChildPage childPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    childPage = new ChildPage();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        setState(() {

        });
      },
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text("Move view"),
          ),
          body: new Center(
              child: childPage,
          )
      ),
    );
  }
}

class ChildPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ChildPageState();
  }
}

class _ChildPageState extends State<ChildPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        color: Colors.green,
      ),
    );
  }
}
