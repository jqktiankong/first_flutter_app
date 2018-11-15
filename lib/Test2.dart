import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Demo'),
        ),
        body: new Center(
          child: new ParentWidget(),
        ),
      ),
    );
  }
}

// widget管理自己的状态
//class TapboxA extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return new _TapboxAState();
//  }
//}
//
//class _TapboxAState extends State<TapboxA> {
//  bool _active = false;
//
//  void _handleTap() {
//    setState(() {
//      _active = !_active;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new GestureDetector(
//      onTap: _handleTap,
//      child: new Container(
//        child: new Center(
//          child: new Text(
//            _active ? 'Active' : 'Inactive',
//            style: new TextStyle(fontSize: 32.0, color: Colors.white),
//          ),
//        ),
//        width: 200.0,
//        height: 200.0,
//        decoration: new BoxDecoration(
//          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
//        ),
//      ),
//    );
//  }
//}

// 父widget管理widget的state
//class ParentWidget extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _ParentWidgetState();
//  }
//}
//
//class _ParentWidgetState extends State<ParentWidget> {
//  bool _active = false;
//
//  void _handleTapboxChanged(bool newValue) {
//    setState(() {
//      print("_active = " + _active.toString());
//      _active = newValue;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new Container(
//      child: new TapboxB(
//        active: _active,
//        onChanged: _handleTapboxChanged,
//      ),
//    );
//  }
//}
//
//class TapboxB extends StatelessWidget {
//  TapboxB({Key key, this.active: false, @required this.onChanged})
//      : super(key: key);
//
//  final bool active;
//  final ValueChanged<bool> onChanged;
//
//  void _handleTap() {
//    onChanged(!active);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new GestureDetector(
//      onTap: _handleTap,
//      child: new Container(
//        child: new Center(
//          child: new Text(
//            active ? 'Active' : 'Inactive',
//            style: new TextStyle(fontSize: 32.0, color: Colors.white),
//          ),
//        ),
//        width: 200.0,
//        height: 200.0,
//        decoration: new BoxDecoration(
//          color: active ? Colors.lightGreen[700] : Colors.grey[600],
//        ),
//      ),
//    );
//  }
//}

// 混合管理
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxC(active: _active, onChanged: _handleTapboxChanged),
    );
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TapboxCState();
  }
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? new Border.all(
                    color: Colors.teal[700],
                    width: 10.0,
                  )
                : null),
      ),
    );
  }
}
