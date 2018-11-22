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
  Entity entity;
  bool showData = false;
  int statusCode = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getProgressDialog() {}

  getData() async {
    Options options = new Options(
      baseUrl: "http://v.juhe.cn/toutiao",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      responseType: ResponseType.JSON,
    );
    Dio dio = new Dio(options);

    try {
      Response response = await dio.get("/index",
          data: {"type": "top", "key": "93ff5c6fd6dc134fc69f6ffe3bc568a6"});
      print("请求数据");
      print(response.data);
      entity = new Entity.fromJson(response.data);
      statusCode = 1;
    } on DioError catch (e) {
      statusCode = -1;
      print("false");
    } on FormatException catch (e) {
      statusCode = -2;
    }
    setState(() {});
  }

  Widget getBody() {
    switch (statusCode) {
      case 0:
        return new Center(
          child: new CircularProgressIndicator(),
        );
        break;
      case 1:
        if (entity.result.data.length == 0) {
          return new Center(
            child: new Text("数据为空"),
          );
        } else {
          return new ListView.builder(
            itemCount: entity.result.data.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            },
          );
        }
        break;
      case -1:
        return new Center(
          child: new Text("网络问题"),
        );
        break;
      case -2:
        return new Center(
          child: new Text("解析错误"),
        );
        break;
    }
  }

  Widget getRow(int position) {
    return new Row(
      children: <Widget>[
        new Image.network(
          entity.result.data[position].thumbnailPicS,
          width: 50.0,
          height: 50.0,
        ),
        Expanded(
          child: new Text(
            "${entity.result.data[position].title}",
            style: TextStyle(fontSize: 12.0),
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: getBody(),
    );
  }
}
