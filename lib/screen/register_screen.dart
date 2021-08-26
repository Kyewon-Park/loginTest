import 'dart:convert';

import 'package:androidstudioprojects/buttons/widePostButton.dart';
import 'package:androidstudioprojects/model/Member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final nameController = TextEditingController();

  Future<Member?> register() async{
    await http.post(
      Uri.parse('http://192.168.137.1:8080/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': idController.text,
        'password': pwController.text
      }),
    ).then((value){
      if (value.statusCode == 201) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        // Member member = Member.fromJson(jsonDecode(value.body));
        // print("${member.memberId}, ${member.email}, ${member.name}");
        // return member;
      } else {
        throw Exception('Failed to create member.');
      }});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false, //키보드가 화면 줄이는 현상 방지
          body: Center(
              child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 8.h, 0, 10),
                      child: Container(
                        width: 80.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 50),
                              child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                              child: Text("Email",textAlign: TextAlign.start,),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  child: TextField(
                                    controller: idController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: 'Enter valid mail id as abc@gmail.com'),
                                  ),
                                ),
                                Container(
                                  width: 20.w,
                                  child: TextButton(
                                    onPressed: (){
                                      //TODO Confirm SCREEN GOES HERE
                                    },
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(color: Colors.blue, fontSize: 10.sp
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        width: 80.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                              child: Text("Password",textAlign: TextAlign.start,),
                            ),
                            TextField(
                              controller: pwController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter your secure password'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 80),
                      child: Container(
                        width: 80.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                              child: Text("Name",textAlign: TextAlign.start,),
                            ),
                            TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter your name'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    WidePostButton(buttonName: "Register", callback: register,),
                  ]))),
    );
  }
}
