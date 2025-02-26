import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(fontSize: 20)),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0, bottom: 10.0), // Increased left padding
                    child: Text(
                      'Today',
                      style: TextStyle(
                        color: Color.fromRGBO(9, 10, 10, 1),
                        fontFamily: 'ADLaM Display',
                        fontSize: 20,
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                  ),
                  NotificationCard(time: '9.56 AM', title: 'Update', description: 'Session Summary updated', icon: Icons.update),
                  NotificationCard(time: '9.56 AM', title: 'Check-In', description: 'It\'s been a while! How are you feeling?', icon: Icons.sentiment_satisfied),
                  NotificationCard(time: '9.56 AM', title: 'Appointment', description: 'Appointment at 10:30 pm today', icon: Icons.calendar_today,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0, bottom: 10.0), // Increased left padding
                    child: Text(
                      'Yesterday',
                      style: TextStyle(
                        color: Color.fromRGBO(9, 10, 10, 1),
                        fontFamily: 'ADLaM Display',
                        fontSize: 20,
                        fontWeight: FontWeight.bold, // Make the text bold
                      ),
                    ),
                  ),
                  NotificationCard(time: '9.56 AM', title: 'Successful rescheduling', description: 'Your appointment on 28/09/24 is success...', icon: Icons.schedule),
                  NotificationCard(time: '9.56 AM', title: 'Appointment', description: 'Doctor rescheduled appointment on 26/09..', icon: Icons.calendar_today),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String time;
  final String title;
  final String description;
  final IconData icon;

  NotificationCard({
    required this.time,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              // Icon
              Icon(icon, size: 28, color: Colors.blue),

              SizedBox(width: 20), // Space between icon and text column

              // Column for Title and Description
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color.fromRGBO(9, 10, 10, 1),
                        fontFamily: 'ADLaM Display',
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis, // Prevent overflow
                      maxLines: 1, // Ensure title fits in one line
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: Color.fromRGBO(119, 119, 119, 1),
                        fontFamily: 'Actor',
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2, // Limit description to one line
                    ),
                  ],
                ),
              ),

              Spacer(),

              // Time Text should be on the right side now
              Text(
                time,
                style: TextStyle(
                  color: Color.fromRGBO(134, 134, 134, 1),
                  fontFamily: 'SF Pro Display',
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
