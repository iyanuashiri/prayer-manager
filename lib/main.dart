import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Manager',
      home: Prayers(),
    );
  }
}

class PrayersState extends State<Prayers> {

  final _style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Prayer Manager'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Doing'),
              Tab(text: 'Thanks-giving'),
              Tab(text: 'Manifested')
            ],

          ),
        ),
        body: TabBarView(
          children: [
            Text('List of Prayer points', style: _style),
            Text('List of Prayers that have moved to Thanks-giving', style: _style),
            Text('List of Prayers that have manifested', style: _style)            
          ],
        ),
        
      ),
    );
    
  }
}

class Prayers extends StatefulWidget {
  @override
  PrayersState createState() => PrayersState();
}