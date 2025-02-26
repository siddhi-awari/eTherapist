import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String anxietyLevel;

  const ResultPage({super.key, required this.anxietyLevel});

  List<String> getOptions(String level) {
    switch (level.toLowerCase()) {
      case 'mild':
        return ['Breathing Exercises', 'Meditation', 'Relaxation Exercises'];
      case 'moderate':
        return ['Meditation', 'Relaxation Exercises', 'VR Sessions'];
      case 'severe':
        return ['Relaxation Exercises', 'VR Sessions', 'Professional Sessions'];
      default:
        return ['Breathing Exercises', 'Meditation', 'Relaxation Exercises'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = getOptions(anxietyLevel);

    return Scaffold(
      appBar: AppBar(
        title: const Text("RESULT", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF078798),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your Anxiety Level",
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF078798),
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(64, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  anxietyLevel,
                  style: const TextStyle(
                    fontSize: 32,
                    fontFamily: 'Georgia',
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(64, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "Therapy Recommendations",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Georgia',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF078798),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF078798), // Border color
                    width: 2, // Border width
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.circle, size: 15, color: Color(0xFF27B6BF)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              option,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 30),

              // Restored Row for Exercises and Sessions buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/exercises');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF27B6BF),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.double_arrow_rounded, color: Colors.black),
                            SizedBox(width: 5),
                            Text(
                              'Exercises',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sessions');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF27B6BF),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.double_arrow_rounded, color: Colors.black),
                            SizedBox(width: 5),
                            Text(
                              'Sessions',
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
