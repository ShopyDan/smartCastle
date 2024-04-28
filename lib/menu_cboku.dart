
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
  List<Widget> widgets = [
    Text('all'),
    Text('Deleted'),
    Users(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Menu',
            style: TextStyle(fontSize: 24),
            ), 
            Icon(Icons.person)
          ],
        ) ,
        centerTitle: true,
        ),
        body: Center(child: widgets.elementAt(SelectedItem)),
        drawer: Drawer(child: ListView(
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
              });
              Navigator.pop(context);
            },
            ),
          ],
        ),),

    );
  }
}