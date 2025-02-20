import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/questions.dart';
import 'package:questoes_enem/modules/questions/controller.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key, required this.year});
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
                  'Questões $year',
                  style: TextTheme.of(context).titleLarge,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: context.read<QuestionsController>().fetchQuestions(year),
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
                        }, (Questions questions) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: questions.questions!.length,
                            itemBuilder: (context, index) => Text('data $index'),
                          );
                        });
                      }
                      return const SizedBox.shrink();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
