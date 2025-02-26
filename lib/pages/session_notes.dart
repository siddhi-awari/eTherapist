import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientVisitsScreen extends StatelessWidget {
  final String patientId;

  const PatientVisitsScreen({Key? key, required this.patientId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(patientId)
            .collection('appointments')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No Visits Found.'));
          }

          final visits = snapshot.data!.docs;

          return ListView.builder(
            itemCount: visits.length,
            itemBuilder: (context, index) {
              var visitData = visits[index].data() as Map<String, dynamic>;
              String visitId = visits[index].id;

              return Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        visitData['date'] ?? 'Unknown Date',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(visitData['summary'] ?? 'No details available'),
                      const SizedBox(height: 10),
                      FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .doc(patientId)
                            .collection('clinical_notes')
                            .where('visit_id', isEqualTo: visitId)
                            .get(),
                        builder: (context, notesSnapshot) {
                          bool hasNotes = notesSnapshot.hasData && notesSnapshot.data!.docs.isNotEmpty;

                          return Align(
                            alignment: Alignment.centerRight,
                            child: hasNotes
                                ? ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VisitNotesScreen(
                                      patientId: patientId,
                                      visitId: visitId,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('View Notes'),
                            )
                                : const Text('No Notes Available', style: TextStyle(color: Colors.grey)),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class VisitNotesScreen extends StatelessWidget {
  final String patientId;
  final String visitId;

  const VisitNotesScreen({Key? key, required this.patientId, required this.visitId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visit Notes')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(patientId)
            .collection('clinical_notes')
            .where('visit_id', isEqualTo: visitId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No Notes Found.'));
          }

          final notes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              var noteData = notes[index].data() as Map<String, dynamic>;

              return Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Objective: ${noteData['objective']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text('Assessment: ${noteData['assessment']}'),
                      const SizedBox(height: 5),
                      Text('Plan: ${noteData['plan']}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
