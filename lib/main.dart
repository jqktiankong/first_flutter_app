//import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new MaterialApp(
//      title: 'Startup Name Generator',
//      theme: new ThemeData(
//        primaryColor: Colors.white
//      ),
//      home: new RandomWords(),
//    );
//  }
//}
//
//class RandomWords extends StatefulWidget {
//  @override
//  createState() => new RandomWordsState();
//}
//
//class RandomWordsState extends State<RandomWords> {
//  final _suggestions = <WordPair>[];
//  final _saved = new Set<WordPair>();
//  final _biggerFont = const TextStyle(fontSize: 18.0);
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Startup Name Generator'),
//        actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
//        ],
//      ),
//      body: _buildSuggestions(),
//    );
//  }
//
//  void _pushSaved() {
//    Navigator.of(context).push(
//        new MaterialPageRoute(
//            builder: (context) {
//              final tiles = _saved.map(
//                      (pari) {
//                    return new ListTile(
//                      title: new Text(
//                        pari.asPascalCase,
//                        style: _biggerFont,
//                      ),
//                    );
//                  }
//              );
//              final divided = ListTile
//                  .divideTiles(
//                context: context,
//                tiles: tiles,
//              )
//              .toList();
//
//              return new Scaffold(
//                appBar: new AppBar(
//                  title: new Text('Saved Suggestions'),
//                ),
//                body: new ListView(children: divided),
//              );
//            }
//        )
//    );
//  }
//
//  Widget _buildRow(WordPair pair) {
//    final alreadySaved = _saved.contains(pair);
//
//    return new ListTile(
//      title: new Text(
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//      trailing: new Icon(
//        alreadySaved ? Icons.favorite : Icons.favorite_border,
//        color: alreadySaved ? Colors.red : null,
//      ),
//      onTap: () {
//        setState(() {
//          if (alreadySaved) {
//            _saved.remove(pair);
//          } else {
//            _saved.add(pair);
//          }
//        });
//      },
//    );
//  }
//
//  Widget _buildSuggestions() {
//    return new ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemBuilder: (context, i) {
//          if (i.isOdd) return new Divider();
//
//          final index = i ~/ 2;
//          if (index >= _suggestions.length) {
//            _suggestions.addAll(generateWordPairs().take(10));
//          }
//          return _buildRow(_suggestions[index]);
//        }
//    );
//  }
//}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample Shared App Handler',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

//  @override
//  _SampleAppPageState createState() => new _SampleAppPageState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  static const platform = const MethodChannel('app.channel.shared.data');
  String dataShared = "No data";

  @override
  void initState() {
    super.initState();
    getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return new Scaffold(body: new Center(child: new Text(dataShared)));
  }

  getSharedText() async {
    var sharedData = await platform.invokeMethod("getSharedText");
    if (sharedData != null) {
      setState(() {
        dataShared = sharedData;
      });
    } else {
      setState(() {
        dataShared = "null";
      });
    }
  }
}
