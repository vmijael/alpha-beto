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
      title: 'Alpha Beto',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MyHomePage(title: 'El Alfa-Beto'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: unused_field
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: AlphabetWidget(orientation: orientation),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AlphabetWidget extends StatelessWidget {
  const AlphabetWidget({Key? key, required this.orientation}) : super(key: key);

  final Orientation orientation;
  final MainAxisAlignment centerAlignment = MainAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return alphabetWidget();
  }

  Widget alphabetWidget() {
    const cardsWidgetArray = [CardWidget(), CardWidget()];

    if (orientation == Orientation.portrait) {
      return Column(
        mainAxisAlignment: centerAlignment,
        children: cardsWidgetArray,
      );
    }

    return Row(
      mainAxisAlignment: centerAlignment,
      children: cardsWidgetArray,
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.orange.withAlpha(30),
        onTap: () {
          print('Hello Card Widget.');
        },
        child: const SizedBox(
          width: 100,
          height: 100,
          child: Text(
            'A',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
