import 'package:flutter/material.dart';

import 'LastestAnime.dart';
import 'SearchAnime.dart';
import 'SeasonalAnime.dart';

/// HomePage class, it has a bottom navigation and handles tab changes
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Current selected index, used to switch tabs
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: <Widget>[
          LastestAnime(),
          SearchAnime(),
          SeasonalAnime(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            title: Text('Latest'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Seasonal'),
          ),
        ],
      ),
    );
  }
}