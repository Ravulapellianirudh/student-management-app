import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:student_management_app/models/student.dart';
import 'package:student_management_app/screens/student_list_screen.dart';

void main() {
  testWidgets(
    'User can delete a student',
        (WidgetTester tester) async {
      final students = [
        Student(
          id: 1,
          name: 'Anirudh',
          email: 'anirudh@gmail.com',
          phone: '9876543210',
          course: 'B.Tech',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: StudentListScreen(
            students: students,
          ),
        ),
      );

      expect(find.text('Anirudh'), findsOneWidget);
      expect(find.text('Total Students : 1'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete));

      await tester.pumpAndSettle();

      expect(find.text('Delete Student'), findsOneWidget);
      expect(
        find.text(
          'Are you sure you want to delete this student?',
        ),
        findsOneWidget,
      );

      await tester.tap(find.text('Delete'));

      await tester.pumpAndSettle();

      expect(students.length, 0);
      expect(find.text('No Students Available'), findsOneWidget);
      expect(find.text('Total Students : 0'), findsOneWidget);
    },
  );
}