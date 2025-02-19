import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/modules/home/controller.dart';
import 'package:questoes_enem/modules/home/widgets/exam_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
              future: context.read<HomeController>().fetchExams(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return snapshot.data!.fold(
                    (AppError error) {
                      return Center(
                        child: Text('${error.error?.message}'),
                      );
                    },
                    (List<Exam> exams) {
                      return Expanded(
                        child: Column(
                          spacing: 16.0,
                          children: [
                            Text(
                              'EXAMES DISPONÍVEIS',
                              style: TextTheme.of(context).titleLarge,
                            ),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(16.0),
                                shrinkWrap: true,
                                itemCount: exams.length,
                                itemBuilder: (context, index) => ExamItemWidget(
                                  exam: exams[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
