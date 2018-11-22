import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'entity.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
        body: new NewsListView(),
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
  var data;
  bool result = false;
  bool showData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    Options options = new Options(
      baseUrl: "http://v.juhe.cn/toutiao",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.JSON,
      headers: {},
    );
    Dio dio = new Dio(options);

    try {
      Response response = await dio.get("/index",
          data: {"type": "top", "key": "93ff5c6fd6dc134fc69f6ffe3bc568a6"});
      print("请求数据");
      print(response.data);
      data = new Entity.fromJson(response.data);
      result = true;
      print("true");
    } on DioError catch (e) {
      result = false;
      print("false");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Text("$result"),
    );
  }
}
