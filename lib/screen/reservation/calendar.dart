import 'dart:convert';
import 'package:androidstudioprojects/buttons/widePostButton.dart';
import 'package:androidstudioprojects/model/Member.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  int selected = 6; //시간 타일 중심 위치
  int itemCount = 12; //시간 타일 개수
  int? hour;//시간

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var _snackBar;//_focusedDay 포함한 스낵바

    Future<Member> postReservation() async {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MyReservations()),
      // );
      String formattedDate = DateFormat('yyyy-MM-dd').format(_focusedDay);
      final response = await http.post(
        Uri.parse('http://192.168.0.8:8080/reservation'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'localDate': formattedDate,
          'hour': hour.toString(),
          'memberId': '1'
          //getMemberId().toString()
        }),
      );
      if(response.statusCode==201){
        return Member.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to create album.');
      }

    }

    void showSnackBar(){
      String formattedDate = DateFormat('yyyy-MM-dd').format(_focusedDay);
      _snackBar = SnackBar(
        content: Text('Date : ' + formattedDate + '/ Hour : ' + hour.toString()),
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }
    //시간 날짜 둘 중 하나 null일 시 출력
    void showEmptySnackBar(){
      _snackBar = SnackBar(
        content: Text('Choose Both Date and Time'),
        duration: Duration(milliseconds: 1000),
      );
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }

    return Scaffold(
      body: Column(
      children: [
        TableCalendar(
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                )),
            todayBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                )),
          ),

          //누른 날짜 마킹
          selectedDayPredicate: (DateTime date) {
            return isSameDay(_selectedDay, date);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay; // update `_focusedDay` here as well

            });

            // ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        Spacer(),
        //2 widget
        Flexible(
          child: RotatedBox(
            quarterTurns: 3,
            child: new ListWheelScrollView(
              itemExtent: 80,
              diameterRatio: 1.7,
              onSelectedItemChanged: (x) {
                setState(() {
                  selected = x;
                  hour=x+10;
                });
              },
              physics: FixedExtentScrollPhysics(),
              children: List<Widget>.generate(
                  13, (index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: index == selected ? 60 : 50,
                        height: index == selected ? 60 : 50,
                        decoration: BoxDecoration(
                            color: index == selected ? Colors.teal[300] : Colors.teal[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                              child: Text(
                            '${index + 10} 시',
                          )),
                        ),
                      );
                  }),
            ),
          ),
        ),
        Spacer(),
        //3 widget
        WidePostButton(buttonName: "선택", callback: (){
          showSnackBar();
          postReservation();
        }),
        Spacer(),
    ],
    ));
  }
}

