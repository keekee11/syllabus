import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SYLLABUS'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // ここを修正
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar and Result Count
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Icon
                      Icon(Icons.search),
                      SizedBox(width: 8.0),
                      // Search Result Count
                      Text('１０件'),
                    ],
                  ),
                ),
                // Three Boxes
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBox(
                      title: 'Mathematics',
                      implementation: 'Lecture',
                      units: '3',
                      professor: 'Dr. Smith',
                      time: '10:00 AM - 11:30 AM',
                      prerequisites: 'Math101',
                      overview: 'This course covers advanced topics in mathematics.',
                    ),
                    _buildBox(
                      title: 'Computer Science',
                      implementation: 'Lab',
                      units: '2',
                      professor: 'Prof. Johnson',
                      time: '2:00 PM - 4:00 PM',
                      prerequisites: 'CS101',
                      overview: 'Explore practical aspects of computer science.',
                    ),
                    _buildBox(
                      title: 'History',
                      implementation: 'Seminar',
                      units: '4',
                      professor: 'Dr. Williams',
                      time: '1:00 PM - 3:00 PM',
                      prerequisites: 'History101',
                      overview: 'In-depth study of historical events.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBox({
    required String title,
    required String implementation,
    required String units,
    required String professor,
    required String time,
    required String prerequisites,
    required String overview,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          width: 600.0,
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              SizedBox(height: 12.0),
              Container(
                color: Colors.lightBlue.withOpacity(0.5),
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Text(
                  '実施形態: $implementation\n単位: $units\n教授名: $professor\n時間帯: $time',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 12.0),
              // Additional details (hidden by default)
              _buildAdditionalDetails(prerequisites, overview),
            ],
          ),
        ),
        // Syllabus Button
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: () {
              // Handle syllabus button press
              print('Syllabus button pressed for $title');
            },
            child: Text('Show Syllabus'),
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalDetails(String prerequisites, String overview) {
    return ExpansionTile(
      title: Text('詳細'),
      children: [
        Text('履修条件: $prerequisites'),
        Text('概要: $overview'),
      ],
    );
  }
}
