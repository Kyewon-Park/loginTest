import 'package:androidstudioprojects/provider/member_provider.dart';
import 'package:androidstudioprojects/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MemberProvider()),
      ],
      child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,deviceType){
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          home: WelcomeScreen(),
      );
    });
  }
}