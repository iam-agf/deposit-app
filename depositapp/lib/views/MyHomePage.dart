import 'package:depositapp/views/Account.dart';
import 'package:depositapp/views/Deposit.dart';
import 'package:depositapp/views/Wallet.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // static const List<Widget> _widgetOptions = <Widget>[ Deposit(), Wallet(), Account()];
  static const List<Widget> _widgetOptions = <Widget>[
    Text("Deposit"),
    Text("Wallet"),
    Text("Account"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/empowerIcon.png"),
              color: null,
            ),
            label: 'Deposit',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/walletIcon.png"),
              color: null,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: mainGreen[900],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
