import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;

  const CustomExpansionTile({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.title,
              Icon(
                _isExpanded ? Icons.remove : Icons.add,
                color: Colors.black,
              ),
            ],
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
          ),
      ],
    );
  }
}

TextStyle _commonTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 15.0,
  );
}

Widget _buildAdditionalDetails(String prerequisites, String overview) {
  return CustomExpansionTile(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Additional Details',
          style: _commonTextStyle(),
        ),
        Icon(Icons.add, color: Colors.white),
      ],
    ),
    children: [
      Text(
        '実施形態: $prerequisites',
        style: _commonTextStyle(), // ここで共通のスタイルを使用
      ),
      Text(
        '単位: $overview',
        style: _commonTextStyle(), // ここで共通のスタイルを使用
      ),
    ],
  );
}

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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 8.0),
                      Text('10件'),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBox(
                      title: 'Mathematics',
                      implementation: 'Lecture',
                      units: '3',
                      professor: 'Dr. Smith',
                      time: '10:00 AM - 11:30 AM',
                      prerequisites: 'attendance',
                      overview: 'This course covers advanced topics in mathematics.',
                    ),
                    _buildBox(
                      title: 'Computer Science',
                      implementation: 'Lab',
                      units: '2',
                      professor: 'Prof. Johnson',
                      time: '2:00 PM - 4:00 PM',
                      prerequisites: 'attendance',
                      overview: 'Explore practical aspects of computer science.',
                    ),
                    _buildBox(
                      title: 'History',
                      implementation: 'Seminar',
                      units: '4',
                      professor: 'Dr. Williams',
                      time: '1:00 PM - 3:00 PM',
                      prerequisites: 'attendance',
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
              _buildAdditionalDetails(prerequisites, overview),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () {
                  print('Syllabus button pressed for $title');
                },
                child: Text('Show Syllabus'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalDetails(String prerequisites, String overview) {
    return CustomExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       
      ),
      children: [
        Text(
          '履修条件: $prerequisites',
          style: _commonTextStyle(),
        ),
        Text(
          '概要: $overview',
          style: _commonTextStyle(),
        ),
      ],
    );
  }
}
