import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          CardItem(),
          SizedBox(height: 32),
          Tags(),
          SizedBox(height: 32),
          Trivia(
            message:
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 100,
            color: Colors.grey,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Some Cool Title",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8),
                Text(
                  "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Tags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Chip(label: Text("Entertainment")),
          Chip(label: Text("Music")),
          Chip(label: Text("Gossips")),
          Chip(label: Text("Trending")),
          Chip(label: Text("Hot")),
          Chip(label: Text("Pop")),
        ],
      ),
    );
  }
}

class Trivia extends StatelessWidget {
  final String message;

  const Trivia({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      color: Colors.grey[350],
      child: Column(
        children: <Widget>[
          Text(
            "Did You Know?",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 4),
          Text(message),
        ],
      ),
    );
  }
}
