import 'package:flutter/material.dart';
import 'package:app/pages/video_page.dart'; // Assuming video_page.dart contains YouTubePlayerPage

class MindExPage extends StatefulWidget {
  @override
  State<MindExPage> createState() => _MindExPageState();
}

class _MindExPageState extends State<MindExPage> {
  final List<Map<String, String>> exercises = [
    {'name': 'Meditation', 'image': 'lib/images/Image.png', 'videoId': 'eA0lHNZ1KCA'},
    {'name': 'Visualization', 'image': 'lib/images/Image (1).png', 'videoId': '24ngiApesiM'},
    {'name': 'Yoga', 'image': 'lib/images/Image (3).png', 'videoId': 'PSnICa0dZRM'},
    {'name': 'Slow Breaths', 'image': 'lib/images/Image (4).png', 'videoId': 'Jn8KvdWagfo'},
    {'name': 'Moderate Exercise', 'image': 'lib/images/Image (5).png', 'videoId': 'LKvn3YtH-zo'},
    {'name': 'Muscle Relaxation', 'image': 'lib/images/Image (2).png', 'videoId': 'SLyeWVtThGA'},
  ];

  // Navigate to the YouTube Player page with the correct video ID
  void _openExerciseVideo(BuildContext context, String videoId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YouTubePlayerPage(videoId: videoId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Title Section
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Mind Exercises',
                  style: TextStyle(
                    color: Color.fromRGBO(6, 1, 62, 1),
                    fontFamily: 'Inter',
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Simple exercises to ease your anxiety.',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Tuffy',
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Images Section (Grid View)
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Open YouTube video for the selected exercise
                        _openExerciseVideo(
                          context,
                          exercises[index]['videoId']!,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          border: Border.all(
                            color: Color.fromRGBO(6, 1, 62, 1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // Image Section
                            Container(
                              width: double.infinity,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                image: DecorationImage(
                                  image: AssetImage(exercises[index]['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            // Exercise Name (Caption)
                            Text(
                              exercises[index]['name']!,
                              style: TextStyle(
                                color: Color.fromRGBO(6, 1, 63, 1),
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:etherapy/pages/video_page.dart';
// import 'package:flutter/material.dart';
//
// class MindExPage extends StatefulWidget {
//   @override
//   State<MindExPage> createState() => _MindExPageState();
// }
//
// class _MindExPageState extends State<MindExPage> {
//   final List<Map<String, String>> exercises = [
//     {'name': 'Meditation', 'image': 'lib/images/Image.png'},
//     {'name': 'Visualization', 'image': 'lib/images/Image (1).png'},
//     {'name': 'Yoga', 'image': 'lib/images/Image (3).png'},
//     {'name': 'Slow Breaths', 'image': 'lib/images/Image (4).png'},
//     {'name': 'Moderate Exercise', 'image': 'lib/images/Image (5).png'},
//     {'name': 'Muscle Relaxation', 'image': 'lib/images/Image (2).png'},
//   ];
//
//   // Navigate to a new page with exercise details
//   void _openExerciseDetails(BuildContext context, String name, String image) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ExerciseDetailPage(name: name, image: image),
//       ),
//     );
//   }
//
//   // Method to navigate to a new page (like a tips page or additional information page)
//   void _navigateToNewPage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => YouTubePlayerPage(), // Replace with your new page
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: <Widget>[
//               // Title Section
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   'Mind Exercises',
//                   style: TextStyle(
//                     color: Color.fromRGBO(6, 1, 62, 1),
//                     fontFamily: 'Inter',
//                     fontSize: 32,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 8),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   'Simple exercises to ease your anxiety.',
//                   style: TextStyle(
//                     color: Color.fromRGBO(0, 0, 0, 1),
//                     fontFamily: 'Tuffy',
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Button Section (below heading)
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to new page when button is pressed
//                   _navigateToNewPage(context);
//                 },
//                 child: Text('Learn More'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromRGBO(6, 1, 62, 1), // button color
//                   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   textStyle: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//
//               // Images Section (Grid View)
//               Expanded(
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 16.0,
//                     mainAxisSpacing: 16.0,
//                     childAspectRatio: 1,
//                   ),
//                   itemCount: exercises.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         // Open new page when image is tapped
//                         _openExerciseDetails(
//                           context,
//                           exercises[index]['name']!,
//                           exercises[index]['image']!,
//                         );
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(27),
//                           border: Border.all(
//                             color: Color.fromRGBO(6, 1, 62, 1),
//                             width: 1,
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             // Image Section
//                             Container(
//                               width: double.infinity,
//                               height: 120,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(27),
//                                 image: DecorationImage(
//                                   image: AssetImage(exercises[index]['image']!),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             // Exercise Name (Caption)
//                             Text(
//                               exercises[index]['name']!,
//                               style: TextStyle(
//                                 color: Color.fromRGBO(6, 1, 63, 1),
//                                 fontFamily: 'Inter',
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ExerciseDetailPage extends StatelessWidget {
//   final String name;
//   final String image;
//
//   ExerciseDetailPage({required this.name, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//         backgroundColor: Color.fromRGBO(6, 1, 62, 1),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Display the image
//             Container(
//               width: 250,
//               height: 250,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(image),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Display exercise name
//             Text(
//               name,
//               style: TextStyle(
//                 color: Color.fromRGBO(6, 1, 62, 1),
//                 fontFamily: 'Inter',
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             // Additional content like description, instructions, etc.
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Here you can add more details about the $name exercise, such as its benefits, instructions, and how to practice it.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
