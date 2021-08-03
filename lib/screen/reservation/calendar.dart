import 'dart:html';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,

        //이벤트
        eventLoader: (day){
          return _getEventsForDay(day);
        },

        //누른 날짜 마킹
        selectedDayPredicate: (DateTime date){
          return isSameDay(_selectedDay, date);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
        onPageChanged: (focusedDay){
          _focusedDay = focusedDay;
        },

        //달력 스타일 조정
        calendarStyle: CalendarStyle(
          selectedDecoration: BoxDecoration(
            color: Colors.orangeAccent,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.blue,

          )
        ),

        //


      ),
    );
  }


}
