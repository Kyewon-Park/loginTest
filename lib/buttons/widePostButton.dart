import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WidePostButton extends StatefulWidget {
  final String buttonName;
  final VoidCallback callback;

  const WidePostButton({Key? key, required this.buttonName, required this.callback}) : super(key: key);

  @override
  _WidePostButtonState createState() => _WidePostButtonState();
}

class _WidePostButtonState extends State<WidePostButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 8.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>((Colors.teal[50])!),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        ),
        onPressed: widget.callback,
        child: Text(
          widget.buttonName,
          style: TextStyle(color: Color(0xFF006175), fontSize: 13.sp),
        ),
      ),
    );
  }
}
