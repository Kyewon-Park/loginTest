import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WideNavigatgeButton extends StatelessWidget {
  WideNavigatgeButton(this.screenRoute, this.buttonName);
  final Widget screenRoute;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 80.w,
        height: 8.h,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>((Colors.teal[50])!)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screenRoute),
            );
          },
          child: Text(
            buttonName,
            style: TextStyle(color: Color(0xFF006175), fontSize: 13.sp),
          ),
        ),
      ),
    );
  }
}