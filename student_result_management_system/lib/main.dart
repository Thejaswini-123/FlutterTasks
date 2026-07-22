import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List <String> studentNames = [
    "Kailash",

    "Rahul",
    "Anjali",
    "Priya",
    "Ashish",
    "Sneha"
  ];

  final Set <String> subjects = {
    "Kannada",
    "English",
    "Hindi",
    "Maths",
    "Science",
    "Social"
  };

  final Map <String, int> marks = {
    "Kailash": 600,
    "Rahul": 570,
    "Anjali": 250,
    "Priya": 460,
    "Ashish": 320,
    "Sneha": 580,
  };

  int calculateTotalMarks(int marks) {
    return marks;
  }

  double calculateAverage(int total) {
    return total / 6;
  }

  String calculateGrade(double average) {

    if(average >= 90) {
      return "A+";
    }
    else if(average >= 80) {
      return "A";
    }
    else if(average >= 70) {
      return "B+";
    }
    else if(average >= 60) {
      return "B";
    }
    else if(average >= 50) {
      return "C+";
    }
    else if(average >= 35) {
      return "C";
    }
    else {
      return "Fail";
    }
  }

  bool isPass(double average) => average >= 35;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Student Result Management System",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,

        ),

        body: Padding(

          padding: const EdgeInsets.all(12),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "Subjects",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                subjects.join(", "),
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 15),

              const Text(
                "Student Results",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(

                child: ListView.builder(

                  itemCount: studentNames.length,

                  itemBuilder: (context, index) {

                    String name = studentNames[index];

                    int total = calculateTotalMarks(marks[name]!);

                    double average = calculateAverage(total);

                    String grade = calculateGrade(average);

                    bool pass = isPass(average);

                    String remarks = "";

                    switch(grade) {

                      case "A+":
                        remarks = "Excellent";
                        break;

                      case "A":
                        remarks = "Very Good";
                        break;

                      case "B+":
                        remarks = "Good";
                        break;

                      case "B":
                        remarks = "Average";
                        break;

                      case "C+":
                        remarks = "Below Average";
                        break;

                      case "C":
                        remarks = "Needs Improvement";
                        break;

                      default:
                        remarks = "Try to Get Passing Marks!";
                        break;
                    }

                    return Card(

                      elevation: 4,

                      child: ListTile(

                        title: Text(name),

                        subtitle: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            Text("Marks : ${marks[name]}"),

                            Text("Average : ${average.toStringAsFixed(2)}"),

                            Text("Grade : $grade"),

                            Text(
                              "Result : ${pass ? "Pass" : "Fail"}",
                            ),

                            Text("Remarks : $remarks"),

                          ],
                        ),
                      ),
                    );


                  },

                ),

              )

            ],

          ),

        ),

      ),

    );

  }
}

