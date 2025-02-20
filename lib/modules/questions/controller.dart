import 'package:flutter/material.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';
import 'package:questoes_enem/models/questions.dart';
import 'package:questoes_enem/modules/questions/repository.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class QuestionsController with ChangeNotifier {
  final QuestionsRepository repository;
  QuestionsController() : repository = getIt<QuestionsRepository>();
  ValueNotifier<List<Question>> allQuestions = ValueNotifier(<Question>[]);
  ValueNotifier<Questions> filteredQuestions = ValueNotifier(Questions());
  ValueNotifier<int> offset = ValueNotifier(0);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ScrollController scrollController = ScrollController();

  void addScrollListener(String year) async {
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLoading.value) {
        // Quando chega ao final da lista, carrega mais dados
        isLoading.value = true;
        notifyListeners();
        await fetchQuestions(year);
        isLoading.value = false;
        notifyListeners();
      }
    });
  }

  Future<Either<AppError, Questions>> fetchQuestions(year) async {
    final Either<AppError, Questions> result = await repository.fetchQuestions(year, offset: offset.value);
    result.fold((AppError error) {}, (Questions questions) {
      allQuestions.value.addAll(questions.questions!);

      allQuestions.notifyListeners();
      offset.value = questions.questions == null ? 0 : offset.value + questions.questions!.length + 1;
      notifyListeners();
    });
    return result;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
