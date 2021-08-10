import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  int selected = 5;
  int itemCount = 12;
  FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 5);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        Flexible(
          child: RotatedBox(
            quarterTurns: 3,
            child: new ListWheelScrollView(
              itemExtent: 80,
              diameterRatio: 1.7,
              onSelectedItemChanged: (x) {
                setState(() {
                  selected = x;
                });
              },
              physics: FixedExtentScrollPhysics(),
              children: List<Widget>.generate(
                  13, (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: index == selected ? 60 : 50,
                        height: index == selected ? 60 : 50,
                        decoration: BoxDecoration(
                            color: index == selected ? Colors.blue : Colors.blue[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Center(
                              child: Text(
                            '${index + 10} 시',
                          )),
                        ),
                      )),
            ),
          ),
        ),
      ],
    ));
  }
}
