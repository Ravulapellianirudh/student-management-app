import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:student_management_app/models/student.dart';
import 'package:student_management_app/screens/edit_student_screen.dart';

void main() {
  testWidgets(
    'Edit Student screen displays existing student details',
        (WidgetTester tester) async {
      final student = Student(
        id: 1,
        name: 'Anirudh',
        email: 'anirudh@gmail.com',
        phone: '9876543210',
        course: 'B.Tech',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: EditStudentScreen(
            student: student,
          ),
        ),
      );

      expect(find.text('Edit Student'), findsOneWidget);

      expect(find.text('Anirudh'), findsOneWidget);
      expect(find.text('anirudh@gmail.com'), findsOneWidget);
      expect(find.text('9876543210'), findsOneWidget);
      expect(find.text('B.Tech'), findsOneWidget);

      expect(find.text('Update Student'), findsOneWidget);
    },
  );

  testWidgets(
    'User can update student name',
        (WidgetTester tester) async {
      final student = Student(
        id: 1,
        name: 'Anirudh',
        email: 'anirudh@gmail.com',
        phone: '9876543210',
        course: 'B.Tech',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: EditStudentScreen(
            student: student,
          ),
        ),
      );

      await tester.enterText(
        find.byType(TextField).at(0),
        'Rahul',
      );

      await tester.tap(find.text('Update Student'));

      await tester.pumpAndSettle();

      expect(student.name, 'Rahul');
      expect(student.email, 'anirudh@gmail.com');
      expect(student.phone, '9876543210');
      expect(student.course, 'B.Tech');
    },
  );
}