import 'package:androidstudioprojects/model/Member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyPage extends StatelessWidget {
  final Member member;
  const MyPage({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
      child: Column(
        children: <Widget>[
          Center(child:CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 50,
          )),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(member.name,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 35,
            width: 250,
            child: Divider(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,),
            child: Container(
              width: 85.w,
              height: 5.h,
              color: Colors.teal[50],
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  Text("-q394304",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp
                    ),
                  ),
                ],

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,),
            child: Container(
              width: 85.w,
              height: 5.h,
              color: Colors.teal[50],
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  Text("-q394304",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp
                    ),
                  ),
                ],

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,),
            child: Container(
              width: 85.w,
              height: 5.h,
              color: Colors.teal[50],
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  Text("-q394304",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp
                    ),
                  ),
                ],

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,),
            child: Container(
              width: 85.w,
              height: 5.h,
              color: Colors.teal[50],
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  Text("-q394304",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp
                    ),
                  ),
                ],

              ),
            ),
          ),
        ],),
    );
  }

}
