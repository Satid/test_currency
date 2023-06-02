import 'package:flutter/material.dart';

import 'currency/currency_view.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, fontFamily: 'Prompt');
  static const List<Widget> _widgetOptions = <Widget>[
    CurrencyView(),
    CurrencyView(),
    CurrencyView(),
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
                  color: Colors.redAccent,
                ),
                icon: Icon(
                  Icons.currency_bitcoin_outlined,
                  color: Colors.grey[700],
                ),
                label: 'CURRENCY',
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(
                  Icons.filter_list_alt,
                  color: Colors.redAccent,
                ),
                icon: Icon(
                  Icons.filter_list_alt,
                  color: Colors.grey[700],
                ),
                label: 'FILLTER',
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(
                  Icons.access_time,
                  color: Colors.redAccent,
                ),
                icon: Icon(
                  Icons.access_time,
                  color: Colors.grey[700],
                ),
                label: 'HISTORY',
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.redAccent,
            selectedFontSize: 12,
            onTap: _onItemTapped,
          ),
        ));
  }
}
