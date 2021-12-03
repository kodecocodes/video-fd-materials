import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: <Widget>[
          const CardItem(),
          const SizedBox(height: 32),
          const Tags(),
          const SizedBox(height: 32),
          const Trivia(
            message:
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({Key? key}) : super(key: key);

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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Some Cool Title',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 8),
                const Text(
                  '''Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis''',
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
  const Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          const Chip(label: Text('Entertainment')),
          const Chip(label: Text('Music')),
          const Chip(label: Text('Gossips')),
          const Chip(label: Text('Trending')),
          const Chip(label: Text('Hot')),
          const Chip(label: Text('Pop')),
        ],
      ),
    );
  }
}

class Trivia extends StatelessWidget {
  final String message;

  const Trivia({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      color: Colors.grey[350],
      child: Column(
        children: <Widget>[
          Text(
            'Did You Know?',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 4),
          Text(message),
        ],
      ),
    );
  }
}
