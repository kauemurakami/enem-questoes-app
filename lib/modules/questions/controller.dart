import 'package:flutter/foundation.dart';
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

  Future<Either<AppError, Questions>> fetchQuestions(year) async {
    final Either<AppError, Questions> result = await repository.fetchQuestions(year, offset: offset.value);
    result.fold((AppError error) {}, (Questions questions) {
      allQuestions.value.addAll(questions.questions!);
      allQuestions.notifyListeners();
    });
    return result;
  }
}
