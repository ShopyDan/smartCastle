import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// добавили в уголу плюсик, загрузка, свайп кнопка удалить и обновить список

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<DocumentSnapshot> Users = [];
  TextEditingController NameController = TextEditingController();
  TextEditingController SurnameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future getUsers() async {
    setState(() {
      loading = true;
    });
    try {
      QuerySnapshot collection =
          await FirebaseFirestore.instance.collection('Users').get();
      setState(() {
        Users = collection.docs;
      });
    } catch (e) {
      print('error gerUsers: $e');
    }
    setState(() {
      loading = false;
    });
  }

  Future creatUser(String Name, Surname, Age) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc()
          .set({'Name': Name, 'Surname': Surname, 'Age': Age});
    } catch (e) {
      print('error createUsers: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Пользователи'),
      ),
      body: loading == true
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                getUsers();
              },
              child: ListView.builder(
                  itemCount: Users.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onLongPress: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: IntrinsicHeight(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(children: [
                                        Text('Точно хотите удалить?'),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Отмена')),
                                            ),
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: ElevatedButton(
                                                  onPressed: () async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('users')
                                                        .doc(Users[index].id)
                                                        .delete();
                                                    getUsers();
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('удалить')),
                                            ),
                                          ],
                                        ),
                                      ]),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Column(
                          children: [
                            Text(
                              Users[index]['Name'],
                            ),
                            Text(
                              Users[index]['Surname'],
                            ),
                            Text(
                              Users[index]['Age'],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: NameController,
                            decoration:
                                InputDecoration(hintText: 'write your name'),
                          ),
                          TextField(
                            controller: SurnameController,
                            decoration:
                                InputDecoration(hintText: 'write your surname'),
                          ),
                          TextField(
                            controller: AgeController,
                            decoration:
                                InputDecoration(hintText: 'write your age'),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () {
                                creatUser(NameController.text,
                                    SurnameController.text, AgeController.text);
                                getUsers();
                                Navigator.pop(context);
                              },
                              child: Text('Добавить'))
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
