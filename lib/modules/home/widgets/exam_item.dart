import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/routes/routes.dart';

class ExamItemWidget extends Card {
  const ExamItemWidget({
    super.key,
    required this.exam,
  });
  final Exam exam;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await context.pushNamed(AppRoutes.exam, extra: exam.year.toString()),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '${exam.title}',
                style: TextTheme.of(context).titleMedium,
              ),
              Text('${exam.year}'),
            ],
          ),
        ),
      ),
    );
  }
}
