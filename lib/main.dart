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

class Prayers extends StatefulWidget {
  @override
  PrayersState createState() => PrayersState();
}

class PrayersState extends State<Prayers> {

  final _style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  final List<String> _currentPrayers = <String>['Iyanu', 'Ire', 'Seun'];
  final List<String> _thanksgivingPrayers = <String>[];
  final List<String> _manifestedPrayers = <String>[];

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
            _buildCurrent(),
            _buildThanksGiving(),
            _buildManifested()          
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.thumb_up),
          backgroundColor: Colors.green,
        ),
        
      ),
    );
  }

  Widget _buildCurrent() {
    final bool _current = _currentPrayers.contains('value');
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _currentPrayers.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_currentPrayers[index]),
          trailing: Icon(
            _current ? Icons.favorite : Icons.favorite_border,
            color: _current ? Colors.red: null,
          ),
          onTap: () {
            setState(() {
              _thanksgivingPrayers.add(_currentPrayers[index]);
              _currentPrayers.remove(_currentPrayers[index]);
            });
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
    
  }

  Widget _buildThanksGiving () {
    final bool _thanksgiving = _thanksgivingPrayers.contains('value');
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _thanksgivingPrayers.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_thanksgivingPrayers[index]),
          trailing: Icon(
            _thanksgiving ? Icons.favorite: Icons.favorite_border,
            color: _thanksgiving ? Colors.green: null,
          ),
          onTap: () {
            setState(() {
              _manifestedPrayers.add(_thanksgivingPrayers[index]);
              _thanksgivingPrayers.remove(_thanksgivingPrayers[index]);
            });
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildManifested () {
    final bool _manifested = _manifestedPrayers.contains('value');
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _manifestedPrayers.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_manifestedPrayers[index]),
          trailing: Icon(
            _manifested ? Icons.favorite: Icons.favorite_border,
            color: _manifested ? Colors.green: null,
          ),
          // onTap: () {
          //   setState(() {
          //     _manifestedPrayers.add()
          //   });
          // },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),      
    );
  }
}
