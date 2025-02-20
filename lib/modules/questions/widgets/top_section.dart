import 'package:flutter/material.dart';

class QuestionsTopSection extends Container {
  QuestionsTopSection({super.key, required this.year});
  final String year;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackButton(),
        Text(
          'Questões ${year}',
          style: TextTheme.of(context).titleLarge,
        )
      ],
    );
  }
}
