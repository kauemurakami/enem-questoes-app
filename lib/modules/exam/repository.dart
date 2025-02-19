import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/services/api.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class ExamRepository {
  final ApiService api = getIt<ApiService>();

  Future<Either<AppError, Exam>> fetchExam(String year) async => await api.fetchExam(year);
}
