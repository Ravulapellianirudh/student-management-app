import 'package:flutter/material.dart';
import '../models/student.dart';
import 'edit_student_screen.dart';

class StudentListScreen extends StatefulWidget {
  final List students;

  const StudentListScreen({
    super.key,
    required this.students,
  });

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student List"),
      ),
      body: widget.students.isEmpty
          ? const Center(
        child: Text(
          "No Students Available",
          style: TextStyle(fontSize: 20),
        ),
      )
          : ListView.builder(
        itemCount: widget.students.length,
        itemBuilder: (context, index) {
          final student = widget.students[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  student.id.toString(),
                ),
              ),
              title: Text(student.name),
              subtitle: Text(
                "${student.email}\n${student.phone}\n${student.course}",
              ),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditStudentScreen(
                            student: student,
                          ),
                        ),
                      );

                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return AlertDialog(
                            title: const Text("Delete Student"),
                            content: const Text(
                              "Are you sure you want to delete this student?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(dialogContext);
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.students.removeAt(index);
                                  });

                                  Navigator.pop(dialogContext);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Student Deleted Successfully",
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}