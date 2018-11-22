import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'entity.dart';
import 'dart:convert';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];
  var datas;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sample App'),
      ),
      body: new ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          }),
    );
  }

  Widget getRow(int i) {
    return new Padding(
      padding: new EdgeInsets.all(10.0),
      child: new Text('Row ${widgets[i]["title"]}'),
    );
  }

  loadData() async {
    String dataURL =
        "http://v.juhe.cn/toutiao/index?type=top&key=93ff5c6fd6dc134fc69f6ffe3bc568a6";
    http.Response response = await http.get(dataURL);
    setState(() {
      print(response.body);
      var datas = new Entity.fromJson(json.decode(response.body));
      print(datas.result.data[0].title);
      String jsonString = json.encode(datas);
//      var a = datas.toJson();
//      print("map = " + a.toString());
//      print("jsonString = " + jsonString);
    });
  }
}
