import 'package:flutter/material.dart';
import 'package:questoes_enem/models/question.dart';

class QuestionItemWidget extends Card {
  const QuestionItemWidget({super.key, required this.question});
  final Question question;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Disciplina: ${question.discipline!}',
              style: TextTheme.of(context).titleMedium,
            ),
            Text(question.title!)
          ],
        ),
      ),
    );
  }
}
