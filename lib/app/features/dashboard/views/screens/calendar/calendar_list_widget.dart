

import 'package:flutter/material.dart';
import 'package:project_management/app/features/dashboard/views/screens/calendar/wrapper.dart';

import '../../../models/data.dart';
import 'list_calendar_data.dart';

class CalendartList extends StatelessWidget {
  final List<CalendarData> datas;

  const CalendartList({Key? key, required this.datas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: datas.isEmpty ? _Empty() : _List(list: datas),
    );
  }
}

class _Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'There are no interviews.',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List<CalendarData> list;

  const _List({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("🔥 Upcoming events"),
        const SizedBox(
          height: 8,
        ),
        Wrapper(
          child: ListCalendarData(calendarData: list),
        ),
      ],
    );
  }
}
