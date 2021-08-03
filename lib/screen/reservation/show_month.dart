import 'package:androidstudioprojects/screen/reservation/calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowMonth extends StatefulWidget {
  const ShowMonth({Key? key}) : super(key: key);

  @override
  _ShowMonthState createState() => _ShowMonthState();
}

class _ShowMonthState extends State<ShowMonth> {
  late DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("data"),
          leading: IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: WillPopScope(child: Calendar(), onWillPop: onWillPop,),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      Fluttertoast.showToast(msg: "뒤로가기 버튼을 두번 누를 시 종료됩니다");
      return Future.value(false);
    }
    return Future.value(true);
  }
}
