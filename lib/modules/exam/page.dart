import 'package:flutter/material.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key, required this.year});
  final String year;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text('Exam page')],
        ),
      ),
    );
  }
}
