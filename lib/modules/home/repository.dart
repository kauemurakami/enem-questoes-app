import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/services/api.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class HomeRepository {
  final ApiService api = getIt<ApiService>();

  Future<Either<AppError, Exam>> fetchExam(String year) async => await api.fetchExam(year);
  Future<Either<AppError, List<Exam>>> fetchExams() async => await api.fetchExams();
}
