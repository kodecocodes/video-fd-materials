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
      home: const MyHomePage(title: 'Calculator Lite'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  double? sum;

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  void _sumNumbers() {
    setState(() {
      sum = double.parse(_num1Controller.text) +
          double.parse(_num2Controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 300,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              key: const Key('txt_field_1'),
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 1',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            TextField(
              key: const Key('txt_field_2'),
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 2',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add'),
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                primary: Colors.white,
              ),
              onPressed: _sumNumbers,
            ),
            if (sum != null)
              Text(
                'Sum: $sum',
                style: Theme.of(context).textTheme.headline4,
              ),
          ],
        ),
      ),
    );
  }
}
