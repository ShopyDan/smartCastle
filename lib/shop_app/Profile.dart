import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'info2.dart';


class Profile extends StatefulWidget {
  final String name;
  final String Surname;
  final String Lastname;
  final String emailAddress;
  final String city;
  final String data;

  Profile({
    Key? key,
    required this.name,
    required this.Surname,
    required this.Lastname,
    required this.emailAddress,
    required this.city,
    required this.data,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = ''; // Изменено на 'String?' если login может быть null
  String username = '';
  String email = '';
  String Address = '';
  String phone = '';
  String website = '';
  String company = '';

  bool ProfileLoading = false;

  @override
  void initState() {
    super.initState();
    // getFromShared();

    getProfile();
  }

  // Future<void> getFromShared() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   setState(() {
  //     login = sp.getString('Login') ??
  //         ''; // Используйте значение по умолчанию, если 'Login' отсутствует
  //   });
  // }

  Future getProfile() async {
    setState(() {
      ProfileLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/8'));

    if (response.statusCode == 200) {
      Info2 info2 = Info2.fromJson(jsonDecode(response.body));

      setState(() {
        name = info2.name!;
        username = info2.username!;
        email = info2.email!;
        Address = info2.address!.street!;
        phone = info2.phone!;
        website = info2.website!;
        company = info2.company!.name!;
        
      });

      setState(() {
       ProfileLoading = false;

     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            'Профиль',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black),
      body: ProfileLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  backgroundImage:
                      // NetworkImage('http'),
                      ExactAssetImage('Assets/ava.jpg'),
                  radius: 100,
                ),
                Center(
                    // child: Container(
                    //   decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16.0),
                    //     child: Image.asset(
                    //       'Assets/ava.jpg',
                    //       width: 150,
                    //       height: 150,
                    //     ),
                    //   ),
                    // ),
                    ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            name,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            username,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      email,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      Address,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      phone,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      website,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      company,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Container(
                //     width: double.infinity,
                //   padding: EdgeInsets.all(16),
                //   decoration: BoxDecoration(
                //     color: Colors.grey,
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //   child: Text(
                //     DateFormat('dd MMMM yyyy','ru').format(DateTime.parse(widget.data)),
                //     style: TextStyle(fontSize: 20, color: Colors.white),
                //   ),
                // ),
                // ),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Выйти', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.yellowAccent,
                        duration: Duration(seconds: 10),
                        content: Row(
                          children: [
                            Icon(Icons.accessibility_new_rounded),
                            Expanded(
                                child: Text('Всем привет!',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 24))),
                          ],
                        )));
                  },
                  child: Text('Show SnackBar',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                ),
              ],
            ),
    );
  }
}
