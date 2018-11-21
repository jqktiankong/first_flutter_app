import 'package:flutter/material.dart';

void main() {
  runApp(new NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "News",
      home: Scaffold(
        appBar: new AppBar(
          title: new Text("News"),
        ),
        body: new Text("haha"),
      ),
    );
  }
}

class NewsListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _NewsListViewState();
  }
}

class _NewsListViewState extends State<NewsListView> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
