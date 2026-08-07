import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentListScreen extends StatelessWidget {
  final List<Student> students;

  const StudentListScreen({
    super.key,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student List"),
      ),
      body: students.isEmpty
          ? const Center(
        child: Text(
          "No Students Available",
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(student.id.toString()),
              ),
              title: Text(student.name),
              subtitle: Text(student.email),
            ),
          );
        },
      ),
    );
  }
}