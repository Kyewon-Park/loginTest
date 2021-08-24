import 'dart:convert';
import 'package:androidstudioprojects/buttons/widePostButton.dart';
import 'package:androidstudioprojects/model/Member.dart';
import 'package:androidstudioprojects/screen/reservation/show_month.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idController = TextEditingController();
  final pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //키보드가 화면 줄이는 현상 방지
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(flex: 2,),
            Container(
                color: Colors.white,
                height: 20.h,
                child: Image.asset('assets/bunny.png', fit: BoxFit.fitHeight,)
            ),
            Spacer(flex: 2,),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                width: 80.w,
                child: TextField(
                  controller: idController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid mail id as abc@gmail.com'
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                width: 80.w,
                child: TextField(
                  controller: pwController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Spacer(flex: 2,),
            WidePostButton(buttonName: "Login", callback: login),
            Spacer(),
            WidePostButton(buttonName: "Register", callback: register,),
            Spacer(flex: 3,),
          ],
        ),
      ),
    );
  }

  Future<Member?> login() async{
    await http.post(
      Uri.parse('http://192.168.137.1:8080/login'), //192.168.0.8:8080
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': idController.text,
        'password': pwController.text
      }),
    ).then((value){
        print(value.body);
        print(value.statusCode);
        if (value.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShowMonth()),
          );
          Member member = Member.fromJson(jsonDecode(value.body));
          print("${member.memberId}, ${member.email}, ${member.name}");
          return member;
        } else {
          throw Exception('Failed to create member.');
        }});
        return null;
    }

  Future<http.Response> register() {
    return http.post(
      Uri.parse('http://192.168.0.8:8080/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': idController.text,
        'password': pwController.text
      }),
    );
  }

}