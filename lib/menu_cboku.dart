
//navigation drawer menu
import 'package:flutter/material.dart';
import 'package:flutter_application_1/users.dart';

class menu_sboku extends StatefulWidget {
  const menu_sboku({super.key});

  @override
  State<menu_sboku> createState() => _menu_sbokuState();
}

class _menu_sbokuState extends State<menu_sboku> {
  int SelectedItem = 0;
  int selectedItemBottom = 0;


  List<Widget> widgets = [
    Text('all'),
    Text('Deleted'),
    Users(),
  ];
  List<Widget> bottomWidgets = [
    Text('messenger'),
    Text('caller'),
    Text('writer'),
  ];

  String selected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Menu',
            style: TextStyle(fontSize: 24),
            ), 
            Icon(Icons.person)
          ],
        ) ,
        centerTitle: true,
        ),
        body: selected == 'drawer'
        ? Center(child: widgets.elementAt(SelectedItem))
        : Center(child: bottomWidgets.elementAt(selectedItemBottom)),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
          children: [DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Name')
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text ('all voise'),
            onTap: () {
              setState(() {
                SelectedItem = 0;
                selected = 'drawer';
              });
              Navigator.pop(context);
            },
            ),
            Divider(thickness: 1, height: 2, color: Colors.grey,),
            ListTile(
            leading: Icon(Icons.message),
            title: Text ('all messengers'),
              onTap: () {
              setState(() {
                SelectedItem = 1;
                selected = 'drawer';
              });
              Navigator.pop(context);
            },
            ),
            Divider(thickness: 1, height: 2, color: Colors.grey,),
            ListTile(
            leading: Icon(Icons.message),
            title: Text ('all person'),
              onTap: () {
              setState(() {
                SelectedItem = 2;
                selected = 'drawer';
              });
              Navigator.pop(context);
            },
            ),
          ],
        ),),
        bottomNavigationBar: BottomNavigationBar(items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.message), label: 'messeger'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), label: 'person'),
        ],
        currentIndex: selectedItemBottom,
        onTap: (value) {
          setState(() {
            selectedItemBottom = value;
            selected = 'bottom';
          });
        },
        )
        
    );
  }
}