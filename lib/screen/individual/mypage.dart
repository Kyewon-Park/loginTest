import 'package:androidstudioprojects/model/Member.dart';
import 'package:flutter/cupertino.dart';

class MyPage extends StatelessWidget {
  final Member member;
  const MyPage({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child: Text('member.name = ${member.name}'),)
    );
  }
}
