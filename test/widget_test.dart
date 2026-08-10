import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:student_management_app/models/student.dart';
import 'package:student_management_app/screens/student_list_screen.dart';

void main() {
  testWidgets('Student list displays students', (WidgetTester tester) async {
    final students = [
      Student(
        id: 1,
        name: 'Anirudh',
        email: 'anirudh@gmail.com',
        phone: '9876543210',
        course: 'B.Tech',
      ),
      Student(
        id: 2,
        name: 'Rahul',
        email: 'rahul@gmail.com',
        phone: '9876543211',
        course: 'BCA',
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: StudentListScreen(
          students: students,
        ),
      ),
    );

    expect(find.text('Student List'), findsOneWidget);

    expect(find.text('Total Students : 2'), findsOneWidget);

    expect(find.text('Anirudh'), findsOneWidget);
    expect(find.text('📧 anirudh@gmail.com'), findsOneWidget);

    expect(find.text('Rahul'), findsOneWidget);
    expect(find.text('📧 rahul@gmail.com'), findsOneWidget);
  });
}