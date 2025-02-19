import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/modules/exam/controller.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key, required this.year});
  final String year;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                BackButton(),
                Text(
                  'Exame $year',
                  style: TextTheme.of(context).titleLarge,
                )
              ],
            ),
            FutureBuilder(
              future: context.read<ExamController>().fetchExam(year),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return snapshot.data!.fold((AppError error) {
                    return Center(
                      child: Text('${error.error?.message}'),
                    );
                  }, (Exam exam) {
                    print('${exam.questions!.first.} aa');
                    return Text('${exam.title}');
                  });
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
