import 'package:flutter/material.dart';

class ExamTopSectionWidget extends Container {
  ExamTopSectionWidget({super.key, required this.year});
  final String year;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButton(),
        Text(
          'Exame $year',
          style: TextTheme.of(context).titleLarge,
        )
      ],
    );
  }
}
