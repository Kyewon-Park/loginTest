import 'package:androidstudioprojects/model/Member.dart';
import 'package:androidstudioprojects/screen/reservation/calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'individual/mypage.dart';
import 'news.dart';

class MiddlePage extends StatefulWidget {
  const MiddlePage({Key? key}) : super(key: key);

  @override
  _MiddlePageState createState() => _MiddlePageState();
}

class _MiddlePageState extends State<MiddlePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var member = Provider.of<Member>(context);
    //Bottom Navigation Bar
    final List<Widget> _children = [Calendar(), MyPage(member: member), News()];

    return SafeArea(
      child: Scaffold(
        body: _children[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          currentIndex: _selectedIndex, //현재 선택된 Index
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
            print(index);
          },
          items: [
            BottomNavigationBarItem(
              label: '예약',
              icon: Icon(Icons.app_registration),
            ),
            BottomNavigationBarItem(
              label: 'My',
              icon: Icon(Icons.account_circle),
            ),
            BottomNavigationBarItem(
              label: '공지',
              icon: Icon(Icons.library_books),
            ),
          ],
        ),
      ),
    );
  }
}
