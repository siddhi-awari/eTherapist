import 'package:app/pages/calendar.dart';
import 'package:flutter/material.dart';

import 'consent.dart';

class TherapyPage extends StatefulWidget {
  @override
  State<TherapyPage> createState() => _TherapyPage();
}

class _TherapyPage extends State<TherapyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Choose Therapy Mode',
                style: TextStyle(
                  color: Color.fromRGBO(6, 1, 62, 1),
                  fontFamily: 'Inter',
                  fontSize: 32,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, spreadRadius: 3)],
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.video_call, size: 40),
                    SizedBox(width: 15),
                    Expanded(  // Ensure Column takes up available space
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'VIRTUAL THERAPY SESSIONS',
                            style: TextStyle(
                              color: Color.fromRGBO(6, 1, 62, 1),
                              fontFamily: 'K2D',
                              fontSize: 20,
                            ),
                            softWrap: true,  // Ensures wrapping of text
                          ),
                          Text(
                            'Engage in live therapy sessions with experts online.',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontFamily: 'K2D',
                              fontSize: 16,
                            ),
                            softWrap: true,  // Ensures wrapping of text
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // One-to-One Conversation Section
              TherapyOptionCard(
                title: 'One-to-One Conversation',
                description: 'Practice personal interactions to ease social discomfort.',
                icon: Icons.arrow_forward,
                onTap: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => consentPage()
                  ),
                );},
              ),
              SizedBox(height: 20),
              // Exam Anxiety Scenario Section
              TherapyOptionCard(
                title: 'Exam Anxiety Scenario',
                description: 'Simulate test conditions to reduce stress and improve focus.',
                icon: Icons.arrow_forward,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => consentPage()
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              // Public Speaking Section
              TherapyOptionCard(
                title: 'Public Speaking',
                description: 'Face a virtual audience to overcome fear and boost confidence.',
                icon: Icons.arrow_forward,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => consentPage()
                    ),
                  );
                },
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, spreadRadius: 3)],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalendarPage()), // Navigate to CalendarPage
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.phone, size: 40),
                      SizedBox(width: 15),
                      Expanded(  // Ensures Column takes up remaining space in the Row
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'OFFLINE SESSIONS',
                              style: TextStyle(
                                color: Color.fromRGBO(6, 1, 62, 1),
                                fontFamily: 'K2D',
                                fontSize: 20,
                              ),
                              softWrap: true,  // Allows text to wrap to the next line
                            ),
                            Text(
                              'Book an offline therapy session for personalized support.',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontFamily: 'K2D',
                                fontSize: 16,
                              ),
                              softWrap: true,  // Allows text to wrap to the next line
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              // // Offline Sessions Section
              // Container(
              //   padding: EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(8),
              //     boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 6, spreadRadius: 3)],
              //   ),
              //   child: Row(
              //     children: <Widget>[
              //       Icon(Icons.phone, size: 40),
              //       SizedBox(width: 15),
              //       Expanded(  // Ensures Column takes up remaining space in the Row
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               'OFFLINE SESSIONS',
              //               style: TextStyle(
              //                 color: Color.fromRGBO(6, 1, 62, 1),
              //                 fontFamily: 'K2D',
              //                 fontSize: 20,
              //               ),
              //               softWrap: true,  // Allows text to wrap to the next line
              //             ),
              //             Text(
              //               'Book an offline therapy session for personalized support.',
              //               style: TextStyle(
              //                 color: Colors.black.withOpacity(0.6),
              //                 fontFamily: 'K2D',
              //                 fontSize: 16,
              //               ),
              //               softWrap: true,  // Allows text to wrap to the next line
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}

class TherapyOptionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const TherapyOptionCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0,),
        child: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),

          child: Row(
            children: <Widget>[
              Icon(icon, size: 36, color: Color.fromRGBO(7, 135, 152, 1)),
              SizedBox(width: 10),
              Expanded(  // Ensures the Column can take the remaining space and allow wrapping
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: Color.fromRGBO(7, 135, 152, 1),
                        fontFamily: 'K2D',
                        fontSize: 18,
                      ),
                      softWrap: true,  // Ensures the text wraps to the next line
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.55),
                        fontFamily: 'K2D',
                        fontSize: 16,
                      ),
                      softWrap: true,  // Ensures the text wraps to the next line
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
