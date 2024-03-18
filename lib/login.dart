import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrapp/profiledata.dart';
import 'package:qrapp/registration.dart';
import 'package:qrapp/profile.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 TextEditingController rollNo=TextEditingController();
 TextEditingController password=TextEditingController();
    Future<void> login() async {

      Uri url = Uri.parse('https://scanner-web-onrender.com/api/login');

      var response=await http.post
        (url,headers:<String,String>{
          'content-Type': 'application/json;charset=UTF-8',
      },
      body:jsonEncode({'rollno':rollNo,'password':password})
      );
      var decodeData=jsonDecode(response.body);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name+',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Roll number',
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: 100,
              height: 30,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrflView(),
                        ));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.teal, fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Reg(),
                      ));
                },
                child: Text('Dont have an Account? Register Now'))
          ],
        ),
      ),
    );
  }
}
