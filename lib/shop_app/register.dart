import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop_app/Profile.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  TextEditingController name = TextEditingController();
  TextEditingController Surname = TextEditingController();
  TextEditingController Lastname = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<String> cities = ['Шымкент', 'Алматы', 'Астана', 'Актау'];
  String selectedCity = 'Шымкент';

  DateTime? selectedDate;

  Future register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress.text, password: password.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(
            name: '',
            Surname: '',
            Lastname: '',
            emailAddress: '',
            city: '',
            data: '',
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 4),
          content: Text(e.code),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
        ),
      );
      //ошибка
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Регистрация'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                      labelText: 'Имя', hintText: 'Напишите имя'),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Имя не заполнено';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: Surname,
                  decoration: InputDecoration(
                      labelText: 'Фамилия', hintText: 'Напишите фамилию'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Фамилия не заполнена';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: Lastname,
                  decoration: InputDecoration(
                      labelText: 'Отчество', hintText: 'Напишите отчество'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Отчество не заполнено';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField(
                    items: cities
                        .map((city) =>
                            DropdownMenuItem(value: city, child: Text(city)))
                        .toList(),
                    value: selectedCity,
                    onChanged: (newCity) {
                      selectedCity = newCity!;
                    }),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Имя пользователя',
                      hintText: 'Придумайте имя пользователя'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Имя пользователя не заполнено';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: 'Пароль', hintText: 'Придумайте пароль'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пароль не заполнен';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                      labelText: 'Повторите пароль',
                      hintText: 'Повторите пароль'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Пароль не заполнен';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailAddress,
                  decoration: InputDecoration(
                      labelText: 'E-mail', hintText: 'Напишите e-mail'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'e-mail не заполнен';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Номер телефона',
                      hintText: 'Введите номер телефона'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Номер не заполнен';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('button clicked');
                    if (_formKey.currentState!.validate()) {
                      register();
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => Profile(
                      //                   name: '',
                      //                   Surname: '',
                      //                   Lastname: '',
                      //                   emailAddress: '',
                      //                   city: '',
                      //                   data: '',
                      //                 )));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  child: Text(
                    'Зарегистрироваться',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
