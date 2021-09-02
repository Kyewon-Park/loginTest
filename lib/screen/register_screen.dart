import 'dart:convert';

import 'package:androidstudioprojects/model/Member.dart';
import 'package:androidstudioprojects/buttons/widePostButton.dart';
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


  Future<void> _showAlertDialog(context, Text text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                text
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<Member?> register() async{
    await http.post(
      Uri.parse('http://192.168.137.1:8080/register'), //192.168.0.8:8080, 192.168.137.1 , 10.90.3.165
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': idController.text,
        'password': pwController.text,
        'name': nameController.text
      }),
    ).then((value){
      print(value.statusCode);
      if (value.statusCode == 201 || value.statusCode == 200) {
        _showAlertDialog(context, Text('회원가입에 성공하였습니다.'));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        throw Exception('Failed to create member.');
        //_showAlertDialog(context, text)
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
                                      http.post(
                                        Uri.parse('http://192.168.137.1:8080/register/validateDuplicateMember'), //192.168.0.8:8080, 192.168.137.1, 10.90.3.165
                                        headers: <String, String>{
                                          'Content-Type': 'application/json; charset=UTF-8',
                                        },
                                        body: jsonEncode(<String, String>{
                                          'email': idController.text,
                                        }),
                                      ).then((value){
                                        print(value.body);
                                        print(value.statusCode);
                                        if (value.body.toString() == true.toString()) {
                                          _showAlertDialog(context,Text('해당 아이디 사용이 가능합니다.'));
                                        } else {
                                          _showAlertDialog(context,Text('이미 존재하는 아이디입니다.'));
                                        }});
                                      return null;
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
