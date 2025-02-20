import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/questions.dart';
import 'package:questoes_enem/modules/questions/widgets/question_item.dart';
import 'package:questoes_enem/modules/questions/controller.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key, required this.year});
  final String year;

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Agora é seguro usar o context.read() aqui
      context.read<QuestionsController>().addScrollListener(widget.year);
    });
  }

  // @override
  // void dispose() {
  //   // Limpa o controlador de rolagem quando o widget for removido
  //   context.read<QuestionsController>().scrollController.dispose();
  //   super.dispose();
  // }

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
                  'Questões ${widget.year}',
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
                    future: context.read<QuestionsController>().fetchQuestions(widget.year),
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
                          return SizedBox(
                            height: MediaQuery.sizeOf(context).height - 100,
                            child: ValueListenableBuilder(
                              valueListenable: context.read<QuestionsController>().isLoading,
                              builder: (context, bool isLoading, child) => ValueListenableBuilder(
                                valueListenable: context.read<QuestionsController>().allQuestions,
                                builder: (context, value, child) => ListView.builder(
                                    shrinkWrap: true,
                                    controller: context.read<QuestionsController>().scrollController,
                                    // itemCount: questions.questions!.length,
                                    itemCount: value.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index == value.length) {
                                        return isLoading
                                            ? Center(
                                                child: CircularProgressIndicator.adaptive(),
                                              )
                                            : SizedBox.shrink();
                                      }
                                      return QuestionItemWidget(
                                        question: value[index],
                                        // question: questions.questions![index],
                                      );
                                    }),
                              ),
                            ),
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
