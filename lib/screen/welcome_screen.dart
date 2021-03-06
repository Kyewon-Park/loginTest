import 'package:androidstudioprojects/buttons/wideNavigateButton.dart';
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Container(
                      child:Text(
                        'Lorem Academy',style: TextStyle(color: Colors.black, fontWeight:FontWeight.bold,fontSize: 20.sp),
                      ),
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      width: 80.w,
                      child: Image.asset('assets/bunny.png', fit: BoxFit.fitHeight,)
                  ),
                  Spacer(),
                  WideNavigatgeButton(LoginScreen(), "로그인"),
                  Spacer(),
                ],
            ),

        ),
      ),
    );
  }
}
