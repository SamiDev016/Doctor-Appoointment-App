import 'package:appointment_application/components/button.dart';
import 'package:appointment_application/components/my_app_bar.dart';
import 'package:appointment_application/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekEnd = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: const MyAppBar(
        appTitle: "Appointment",
        icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _tableCalender(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      "Pick a Consultation Day",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          _isWeekEnd
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: Text(
                      "Weekend is not Available , Select another Date",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                          _timeSelected = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: _currentIndex == index
                              ? Config.primaryColor
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null),
                        ),
                      ),
                    );
                  }, childCount: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5),
                ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: MyButton(
                width: double.infinity,
                title: "Make Appointment",
                disable: _timeSelected && _dateSelected ? false : true,
                onPressed: (){},
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalender() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 34),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
              color: Config.primaryColor, shape: BoxShape.circle)),
      availableCalendarFormats: const {CalendarFormat.month: 'Months'},
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekEnd = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekEnd = false;
          }
        });
      })),
    );
  }
}
