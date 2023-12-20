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
        child: Align(
          alignment: Alignment.center, // Center the content
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
