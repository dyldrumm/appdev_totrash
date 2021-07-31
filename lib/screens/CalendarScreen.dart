import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:totrash/helpers/common.dart';
import 'package:totrash/objs/items.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.schedule,
        scheduleViewSettings: ScheduleViewSettings(
          hideEmptyScheduleWeek: true,
        ),
        initialDisplayDate: DateTime.now(),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meeting = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day);
  final DateTime endTime = DateTime(today.year, today.month, today.day);

  // for (Items item in Common.items) {
  //   meeting.add(Appointment(
  //     startTime: DateTime.utc(item.year, item.month, item.day),
  //   ));
  // }

  meeting.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Milk Expires today',
      color: Colors.red,
      isAllDay: true));

  meeting.add(Appointment());

  return meeting;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
