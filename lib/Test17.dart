import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Navigation Basics",
    home: new FirstScreen(),
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("First Screen"),
      ),
      body: new Center(
        child: new RaisedButton(
            child: new Text("Launch new screen"),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) {
                  return new SecondScreen();
                }),
              );
            }),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Second Screen"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text("Go back!"),
        ),
      ),
    );
  }
}
