import 'package:flutter/material.dart';
import 'package:flutter_curency_app/ui/exchange.dart';
import 'package:flutter_curency_app/ui/home.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  Widget getView() {
    if (_selectedIndex == 0) {
      return const HomePage();
    }
    return const Exchange();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Flutter Currency Convert"),
      ),
      body: getView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange), label: "Exchange"),
        ],
      ),
    );
  }
}
