import 'package:flutter/material.dart';
import 'package:flutter_go_club_app/pages/clubs_page.dart';
import 'package:flutter_go_club_app/pages/home_user_page.dart';

import '../place_holder_widget.dart';

class RootNavBarGeneric extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootNavBarGenericState();
  }
}

class _RootNavBarGenericState extends State<RootNavBarGeneric> {
  int _currentIndex = 0;
  final List<Widget> _childrenRoutes = [
    PlaceholderWidget(HomePage()),
    PlaceholderWidget(ClubsPage()),
    PlaceholderWidget(ClubsPage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childrenRoutes[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.green,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.greenAccent,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))),
        // sets the inactive color of the `BottomNavigationBar`

        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Reservas')),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark),
              title: Text('Serv'),
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
