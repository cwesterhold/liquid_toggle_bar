import 'package:flutter/material.dart';
import 'package:liquid_toggle_bar/liquid_toggle_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquid Toggle Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Liquid Toggle Bar Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> tabsNames = ['Screen One', 'Screen Two', 'Screen Three'];
  int currentIndex = 0;

  List<dynamic> screenList = [ScreenOne(), ScreenTwo(), ScreenThree()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text("Liquid Toggle Bar Example", style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: LiquidToggleBar(
                tabsNames: tabsNames,
                borderRadius: 8,
                backgroundColor: Colors.grey,
                selectedTabColor: Theme.of(context).primaryColor,
                tabColor: Theme.of(context).accentColor,
                onSelectionUpdated: (index) => setState(() => currentIndex = index),
              ),
            ),
            Expanded(child: screenList[currentIndex]),
          ],
        ),
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            ' - Screen One - ',
            style: TextStyle(fontSize: 25),
          ),
          Icon(Icons.email)
        ],
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            ' - Screen Two - ',
            style: TextStyle(fontSize: 25),
          ),
          Icon(Icons.flag)
        ],
      ),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            ' - Screen Three - ',
            style: TextStyle(fontSize: 25),
          ),
          Icon(Icons.ac_unit)
        ],
      ),
    );
  }
}
