import 'package:app/pages/home_page.dart';
import 'package:app/pages/profile_page.dart';
import 'package:app/pages/calendar.dart';
import 'package:app/pages/therapy_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'noti_page.dart';

class AfterSession extends StatefulWidget {
  @override
  State<AfterSession> createState() => _AfterSessionState();
}

class _AfterSessionState extends State<AfterSession> {
  // Controller for the feedback text input
  TextEditingController feedbackController = TextEditingController();

  // Function to submit feedback to Firestore
  void _submitFeedback() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && feedbackController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('feedback')
          .add({
        'session': 'Session 1', // Customize as needed
        'feedback': feedbackController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully!')),
      );

      feedbackController.clear(); // Clear the input field after submission
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter feedback before submitting.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF078798),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home_filled, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Session Completion message
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFF078798).withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF078798),
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Session 1 Completed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lucida Sans',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Feedback section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(7, 135, 152, 0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(7, 135, 152, 1),
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Feedback',
                    style: TextStyle(
                      color: Color(0xFF078798),
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Write about your experience this session',
                    style: TextStyle(
                      color: Color(0xFF078798),
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),

                  TextField(
                    controller: feedbackController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Type here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFF078798),
                          width: 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                    style: TextStyle(
                      color: Color.fromRGBO(7, 135, 152, 1),
                      fontFamily: 'K2D',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Submit Feedback Button
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFF078798),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: _submitFeedback,
                child: Text(
                  'Submit Feedback',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Other action buttons
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFF078798),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TherapyPage()),
                  );
                },
                child: Text(
                  'Take another session',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFF078798),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalendarPage()),
                  );
                },
                child: Text(
                  'Book offline session',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:app/pages/home_page.dart';
// import 'package:app/pages/profile_page.dart';
// import 'package:app/pages/calendar.dart';
// import 'package:app/pages/therapy_page.dart';
// import 'package:flutter/material.dart';
//
// import 'noti_page.dart';
//
// class AfterSession extends StatefulWidget {
//   @override
//   State<AfterSession> createState() => _AfterSessionState();
// }
//
// class _AfterSessionState extends State<AfterSession> {
//   // Controller for the feedback text input
//   TextEditingController feedbackController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF078798),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.home_filled, color: Colors.white),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NotificationPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),  // Add padding around the body content
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,  // Align the text to the left
//           children: <Widget>[
//             // Session Completion message in a box
//             Container(
//               width: double.infinity,
//               height: 80,
//               decoration: BoxDecoration(
//                 color: Color(0xFF078798).withOpacity(0.7),
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Color(0xFF078798),
//                   width: 2,
//                 ),
//               ),
//               padding: EdgeInsets.all(16),
//               child: Center(
//                 child: Text(
//                   'Session 1 Completed',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'Lucida Sans',
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     height: 1,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20), // Space between sections
//
//             // Feedback section in a box
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(7, 135, 152, 0.1), // Light blue background
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Color.fromRGBO(7, 135, 152, 1), // Blue border color
//                   width: 2,
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Feedback',
//                     style: TextStyle(
//                       color: Color(0xFF078798),
//                       fontFamily: 'Inter',
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Write about your experience this session',
//                     style: TextStyle(
//                       color: Color(0xFF078798),
//                       fontFamily: 'Inter',
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(height: 10), // Space between description and feedback input
//
//                   TextField(
//                     controller: feedbackController,
//                     maxLines: 10,  // Allow multiple lines
//                     decoration: InputDecoration(
//                       hintText: 'Type here', // Placeholder text
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide(
//                           color: Color(0xFF078798),
//                           width: 2,
//                         ),
//                       ),
//                       contentPadding: EdgeInsets.all(10),
//                     ),
//                     style: TextStyle(
//                       color: Color.fromRGBO(7, 135, 152, 1),
//                       fontFamily: 'K2D',
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20), // Space between sections
//
//             // Action buttons (Take another session and Book offline session)
//             Container(
//               width: double.infinity,
//               height: 56,
//               decoration: BoxDecoration(
//                 color: Color(0xFF078798),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => TherapyPage()),
//                   );
//                 },
//                 child: Text(
//                   'Take another session',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'Inter',
//                     fontSize: 22,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16), // Space between the buttons
//             Container(
//               width: double.infinity,
//               height: 56,
//               decoration: BoxDecoration(
//                 color: Color(0xFF078798),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => CalendarPage()),
//                   );
//                 },
//                 child: Text(
//                   'Book offline session',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'Inter',
//                     fontSize: 22,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }