import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/modules/exam/controller.dart';
import 'package:questoes_enem/modules/exam/widgets/discipline_item.dart';
import 'package:questoes_enem/routes/routes.dart';
import 'package:questoes_enem/widgets/button.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key, required this.year});
  final String year;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${exam.questions?.length} questões',
                            style: TextTheme.of(context).bodyLarge,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: exam.disciplines?.length ?? 1,
                            itemBuilder: (context, index) =>
                                DisciplineItemWidget(disciplineTitle: exam.disciplines![index].label!),
                          ),
                          DefaultButton(
                              callback: () async => await context.pushNamed(
                                    AppRoutes.questions,
                                    extra: exam.year.toString(),
                                  ),
                              text: 'IR PARA QUESTÕES')
                        ],
                      ),
                    );
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
