import 'package:flutter/material.dart';
import 'package:app/util/question_tile.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List of questions and options
  final List<Map<String, dynamic>> questions = [
    {
      "questionText": "What is the capital of France?",
      "options": ["Berlin", "Madrid", "Paris", "Rome"],
      "correctAnswerIndex": 2
    },
    {
      "questionText": "What is the capital of Spain?",
      "options": ["Berlin", "Madrid", "Paris", "Rome"],
      "correctAnswerIndex": 1
    },
    {
      "questionText": "What is the capital of Italy?",
      "options": ["Berlin", "Madrid", "Paris", "Rome"],
      "correctAnswerIndex": 3
    },
    {
      "questionText": "What is the capital of Germany?",
      "options": ["Berlin", "Madrid", "Paris", "Rome"],
      "correctAnswerIndex": 0
    },
    {
      "questionText": "What is the capital of Japan?",
      "options": ["Berlin", "Tokyo", "Paris", "Rome"],
      "correctAnswerIndex": 1
    },
    {
      "questionText": "What is the capital of USA?",
      "options": ["Washington D.C.", "New York", "Los Angeles", "Chicago"],
      "correctAnswerIndex": 0
    },
    {
      "questionText": "What is the capital of Canada?",
      "options": ["Toronto", "Vancouver", "Ottawa", "Montreal"],
      "correctAnswerIndex": 2
    },
    {
      "questionText": "What is the capital of UK?",
      "options": ["London", "Edinburgh", "Manchester", "Birmingham"],
      "correctAnswerIndex": 0
    },
    {
      "questionText": "What is the capital of India?",
      "options": ["Delhi", "Mumbai", "Kolkata", "Bangalore"],
      "correctAnswerIndex": 0
    },
    {
      "questionText": "What is the capital of Australia?",
      "options": ["Sydney", "Melbourne", "Canberra", "Brisbane"],
      "correctAnswerIndex": 2
    },
  ];

  // To track selected answers for each question
  List<int?> selectedAnswers = List.filled(10, null); // Default null for no selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scrollbar(
          thumbVisibility: true,  // This ensures the scrollbar is always visible
          thickness: 10.0, // Adjust the thickness of the scrollbar
          radius: Radius.circular(10),
        // Optionally round the corners of the scrollbar
          child: SingleChildScrollView( // Ensure the whole content is scrollable
            child: Column(
              children: [
            const Padding(
            padding: EdgeInsets.all(2.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Anxiety Self Check",
                style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontStyle: FontStyle.italic,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        const Padding(
        padding: EdgeInsets.all(1.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Evaluate your social anxiety in minutes.",
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
          ),
        ),
      ),
                ListView.builder(
                  shrinkWrap: true, // Makes ListView not take up more space than it needs
                  physics: NeverScrollableScrollPhysics(), // Prevents the ListView from scrolling separately
                  itemCount: questions.length, // Total number of questions
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: QuestionTile(
                        questionText: question["questionText"],
                        options: question["options"],
                        selectedOptionIndex: selectedAnswers[index], // Track the selected option
                        onOptionSelected: (selectedIndex) {
                          setState(() {
                            selectedAnswers[index] = selectedIndex; // Update the selected answer
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}