import 'package:androidstudioprojects/provider/member_provider.dart';
import 'package:androidstudioprojects/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,deviceType){
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Academy Reservation',
          builder: (context, child) => new SafeArea(child: new Material(color: Colors.white, child: child)),
          home: WelcomeScreen(),
      );
    });
  }
}