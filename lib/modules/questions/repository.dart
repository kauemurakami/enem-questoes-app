import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';
import 'package:questoes_enem/models/questions.dart';
import 'package:questoes_enem/services/api.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class QuestionsRepository {
  final ApiService api = getIt<ApiService>();
  Future<Either<AppError, Questions>> fetchQuestions(String year, {int? offset = 0}) async =>
      await api.fetchQuestions(year, offset: offset);
}
