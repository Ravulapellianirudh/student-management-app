import 'package:flutter/material.dart';
import '../models/student.dart';
import 'edit_student_screen.dart';

class StudentListScreen extends StatefulWidget {
  final List<Student> students;

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
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            color: Colors.blue.shade100,
            child: Text(
              "Total Students : ${widget.students.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: widget.students.isEmpty
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
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Text(student.id.toString()),
                            ),

                            const SizedBox(width: 15),

                            Expanded(
                              child: Text(
                                student.name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditStudentScreen(
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

                        const SizedBox(height: 10),

                        Text(
                          "📧 ${student.email}",
                          style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "📱 ${student.phone}",
                          style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "🎓 ${student.course}",
                          style: const TextStyle(fontSize: 16),
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
    );
  }
}