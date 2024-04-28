

import 'package:flutter/material.dart';
import 'package:flutter_application_1/users.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  int selectedItem = 0;
  List<Widget> widgets = [
    Text('Home'),
    Text('Basket'),
    //Text('Profile')
    Users()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instagram'),
      centerTitle: true,
      ),
      body: Center(child: widgets.elementAt(selectedItem)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Backet'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')

        ],
        currentIndex: selectedItem,
        onTap: (value) {
          setState(() {
            selectedItem = value;
          });
        },
        ),
    );
  }
}