import 'package:app/pages/profile_page.dart';
import 'package:flutter/material.dart';

import 'noti_page.dart';
import 'therapy_page.dart';

class AfterSession extends StatefulWidget {
  @override
  State<AfterSession> createState() => _AfterSessionState();
}

class _AfterSessionState extends State<AfterSession> {
  // Controller for the feedback text input
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.home_filled, color: Colors.black45),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black45),
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
        padding: const EdgeInsets.all(16.0),  // Add padding around the body content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Align the text to the left
          children: <Widget>[
            // Session Completion message in a box
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromRGBO(125, 25, 25, 0.1), // Light red background
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(125, 25, 25, 1), // Red border color
                  width: 2,
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Session 1 Completed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(125, 25, 25, 1.0),
                    fontFamily: 'Lucida Sans',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Space between sections

            // Feedback section in a box
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(7, 135, 152, 0.1), // Light blue background
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(7, 135, 152, 1), // Blue border color
                  width: 2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Feedback title
                  Text(
                    'Feedback',
                    style: TextStyle(
                      color: Color.fromRGBO(7, 135, 152, 1),
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Space between feedback title and description

                  // Feedback description
                  Text(
                    'Write about your experience this session',
                    style: TextStyle(
                      color: Color.fromRGBO(7, 135, 152, 1),
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10), // Space between description and feedback input

                  // TextField to allow user to type their feedback
                  TextField(
                    controller: feedbackController,
                    maxLines: 4,  // Allow multiple lines
                    decoration: InputDecoration(
                      hintText: 'Type here', // Placeholder text
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(7, 135, 152, 1),
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
            SizedBox(height: 20), // Space between sections

            // Action buttons (Take another session and Book offline session)
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: Color.fromRGBO(7, 135, 152, 1),
                borderRadius: BorderRadius.circular(10),
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
                    fontFamily: 'K2D',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Space between the buttons
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: Color.fromRGBO(7, 135, 152, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  // Action for the button (e.g., navigate to a new page)
                },
                child: Text(
                  'Book offline session',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'K2D',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
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


// import 'package:etherapy/pages/profile_page.dart';
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.home_filled, color: Colors.black45),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfilePage()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.black45),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NotificationPage()),
//               );
//
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
//                 color: Color.fromRGBO(125, 25, 25, 0.1), // Light red background
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                   color: Color.fromRGBO(125, 25, 25, 1), // Red border color
//                   width: 2,
//                 ),
//               ),
//               padding: EdgeInsets.all(16),
//               child: Center(
//                 child: Text(
//                   'Session 1 Completed',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Color.fromRGBO(125, 25, 25, 1.0),
//                     fontFamily: 'Lucida Sans',
//                     fontSize: 24,
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
//                       color: Color.fromRGBO(7, 135, 152, 1),
//                       fontFamily: 'Inter',
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10), // Space between feedback title and description
//                   Text(
//                     'Write about your experience this session',
//                     style: TextStyle(
//                       color: Color.fromRGBO(7, 135, 152, 1),
//                       fontFamily: 'Inter',
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(height: 10), // Space between description and feedback
//                   Text(
//                     'Great session, helped in building confidence....',
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
//                 color: Color.fromRGBO(7, 135, 152, 1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextButton(
//                 onPressed: () {
//                   // Action for the button (e.g., navigate to a new page)
//                 },
//                 child: Text(
//                   'Take another session',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'K2D',
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16), // Space between the buttons
//             Container(
//               width: double.infinity,
//               height: 56,
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(7, 135, 152, 1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: TextButton(
//                 onPressed: () {
//                   // Action for the button (e.g., navigate to a new page)
//                 },
//                 child: Text(
//                   'Book offline session',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: 'K2D',
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
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
//
