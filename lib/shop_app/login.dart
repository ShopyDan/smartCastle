import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop_app/Profile.dart';
import 'package:flutter_application_1/shop_app/register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool hidePassword = false;

  bool loading = false;

  Future login() async {

    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginController.text, password: passwordController.text);
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
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Логин'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: loginController,
                decoration: InputDecoration(
                  labelText: 'Логин',
                  hintText: 'Напишите логин',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == '') {
                    return 'Логин не заполнен';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  hintText: 'Напишите пароль',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value == '') {
                    return 'Пароль не заполнен';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              loading == true?
              Center(child: CircularProgressIndicator()):
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Замените следующую строку на вашу логику перехода.
                    // В данный момент упоминается класс 'Profile', но его реализация не предоставлена.
                    login();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                child: Text('Войти'),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  // Замените следующую строку на вашу логику перехода.
                  // В данный момент упоминается класс 'Register', но его реализация не предоставлена.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register2()),
                  );
                },
                child: Text(
                  'Если нет аккаунта, то зарегистрируйтесь',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
