import 'package:flutter/material.dart';

import 'currency/currency_view.dart';
import 'filter/filter_view.dart';
import 'history/history_view.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal);
  static const List<Widget> _widgetOptions = <Widget>[
    CurrencyView(),
    FilterView(),
    HistoryView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: const Icon(
                  Icons.currency_bitcoin_outlined,
                  color: Colors.blueAccent,
                ),
                icon: Icon(
                  Icons.currency_bitcoin_outlined,
                  color: Colors.grey[700],
                ),
                label: 'Currency',
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(
                  Icons.calculate_outlined,
                  color: Colors.blueAccent,
                ),
                icon: Icon(
                  Icons.calculate_outlined,
                  color: Colors.grey[700],
                ),
                label: 'Calculate',
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(
                  Icons.access_time,
                  color: Colors.blueAccent,
                ),
                icon: Icon(
                  Icons.access_time,
                  color: Colors.grey[700],
                ),
                label: 'History',
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueAccent,
            selectedFontSize: 12,
            onTap: _onItemTapped,
          ),
        ));
  }
}
