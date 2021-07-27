import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Container(
                    child:Text(
                      'Lorem Ipsum',style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 20.sp),
                    ),
                  ),
                  Container(
                      color: Colors.black,
                      height: 60.h,
                      child: Image.asset('assets/bunny.png', fit: BoxFit.fitHeight,)
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 80.w,
                      height: 8.h,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>((Colors.teal[50])!)
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(
                          '로그인',style: TextStyle(color: Color(0xFF006175),fontSize: 13.sp),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
            ),

        ),
      ),
    );
  }
}
