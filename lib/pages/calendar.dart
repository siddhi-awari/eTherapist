import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// Appointment class definition
class Appointment {
  final String time;

  Appointment({required this.time});
}

class CalendarPage extends StatefulWidget {
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now(); // Initially set to current date
  DateTime _focusedDate = DateTime.now(); // Focus date for calendar
  Map<String, List<Appointment>> appointments = {
    '2025-01-09': [
      Appointment(time: '9:00 AM - 10:30 AM'),
      Appointment(time: '1:00 PM - 2:30 PM'),
    ],
    '2025-01-15': [
      Appointment(time: '11:00 AM - 12:00 PM'),
      Appointment(time: '3:00 PM - 4:00 PM'),
    ],
    '2025-01-24': [
      Appointment(time: '9:00 AM - 10:00 AM'),
      Appointment(time: '12:00 PM - 1:00 PM'),
    ],
    '2025-01-31': [
      Appointment(time: '1:30 PM - 2:30 PM'),
      Appointment(time: '4:30 PM - 5:30 PM'),
    ],
  };

  // Get appointments for selected date, with a max of 2 appointments
  List<Appointment> _getAppointmentsForSelectedDate() {
    String formattedDate = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}';
    return appointments[formattedDate]?.take(2).toList() ?? [];
  }

  // Method to handle date selection
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
      _focusedDate = focusedDay; // Update focused date for calendar navigation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        backgroundColor: Color.fromRGBO(177, 174, 228, 1.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      'lib/images/avatar.png', // Ensure the image path is correct
                      width: 70.0,
                      height: 70.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Doctor',
                    style: TextStyle(
                      color: Color.fromRGBO(6, 1, 62, 1),
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDate,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
              onDaySelected: _onDaySelected,
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronVisible: true,
                rightChevronVisible: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Upcoming Appointments for ${_selectedDate.toLocal()}'.split(' ')[0],
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(110, 181, 193, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Display Appointments based on the selected date
            if (_getAppointmentsForSelectedDate().isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 27),
                child: Text(
                  'No appointments available for this date.',
                  style: TextStyle(
                    color: Color.fromRGBO(110, 181, 193, 1.0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ..._getAppointmentsForSelectedDate().map(
                  (appointment) => AppointmentCard(
                date: _selectedDate.toLocal().toString().split(' ')[0],
                time: appointment.time,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatefulWidget {
  final String date;
  final String time;

  const AppointmentCard({
    required this.date,
    required this.time,
  });

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  bool _isSelected = false;

  // Toggle the selection state
  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        height: 61,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(7, 135, 152, 0.58),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: _toggleSelection,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isSelected ? Colors.green : Colors.transparent,
                      border: Border.all(
                        color: _isSelected ? Colors.green : Colors.black26,
                      ),
                    ),
                    child: Icon(
                      _isSelected ? Icons.check_circle : Icons.circle_outlined,
                      color: _isSelected ? Colors.black26 : Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Time: ',
                          style: TextStyle(
                            color: Color.fromRGBO(23, 20, 20, 1.0),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(
                            color: Color.fromRGBO(9, 10, 10, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
