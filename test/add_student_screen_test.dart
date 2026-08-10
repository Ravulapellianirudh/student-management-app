  import 'package:flutter/material.dart';
  import 'package:flutter_test/flutter_test.dart';

  import 'package:student_management_app/data/student_data.dart';
  import 'package:student_management_app/screens/add_student_screen.dart';

  void main() {
    testWidgets(
      'Add Student screen displays all fields',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: AddStudentScreen(),
          ),
        );

        expect(find.text('Add Student'), findsOneWidget);
        expect(find.text('Student Name'), findsOneWidget);
        expect(find.text('Email'), findsOneWidget);
        expect(find.text('Phone Number'), findsOneWidget);
        expect(find.text('Course'), findsOneWidget);
        expect(find.text('Save Student'), findsOneWidget);
      },
    );

    testWidgets(
      'Empty fields show validation messages',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: AddStudentScreen(),
          ),
        );

        await tester.tap(find.text('Save Student'));

        await tester.pump();

        expect(
          find.text('Please enter student name'),
          findsOneWidget,
        );

        expect(
          find.text('Please enter email'),
          findsOneWidget,
        );

        expect(
          find.text('Please enter phone number'),
          findsOneWidget,
        );

        expect(
          find.text('Please enter course'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'User can enter student details',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: AddStudentScreen(),
          ),
        );

        await tester.enterText(
          find.byType(TextFormField).at(0),
          'Anirudh',
        );

        await tester.enterText(
          find.byType(TextFormField).at(1),
          'anirudh@gmail.com',
        );

        await tester.enterText(
          find.byType(TextFormField).at(2),
          '9876543210',
        );

        await tester.enterText(
          find.byType(TextFormField).at(3),
          'B.Tech',
        );

        expect(find.text('Anirudh'), findsOneWidget);
        expect(find.text('anirudh@gmail.com'), findsOneWidget);
        expect(find.text('9876543210'), findsOneWidget);
        expect(find.text('B.Tech'), findsOneWidget);
      },
    );

    testWidgets(
        'User can save a student',
            (WidgetTester tester) async {
          studentList.clear();

          await tester.pumpWidget(
            const MaterialApp(
              home: AddStudentScreen(),
            ),
          );

          await tester.enterText(
            find.byType(TextFormField).at(0),
            'Anirudh',
          );

          await tester.enterText(
            find.byType(TextFormField).at(1),
            'anirudh@gmail.com',
          );

          await tester.enterText(
            find.byType(TextFormField).at(2),
            '9876543210',
          );

          await tester.enterText(
            find.byType(TextFormField).at(3),
            'B.Tech',
          );

          await tester.tap(find.text('Save Student'));

          await tester.pumpAndSettle();

          expect(studentList.length, 1);

          expect(studentList[0].name, 'Anirudh');
          expect(studentList[0].email, 'anirudh@gmail.com');
          expect(studentList[0].phone, '9876543210');
          expect(studentList[0].course, 'B.Tech');

          expect(find.text('Student List'), findsOneWidget);
          expect(find.text('Anirudh'), findsOneWidget);
        });

    tearDown(() {
      studentList.clear();
    });
  }