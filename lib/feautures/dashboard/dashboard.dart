import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(

              icon: Icon(Icons.home),
              tooltip: "Category",
              label: ""
          ),
          BottomNavigationBarItem(

              icon: Icon(Icons.post_add),
              tooltip: "Category",
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              tooltip: "Account",
              label: ""

          ),
        ],

      ),
      body: Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
