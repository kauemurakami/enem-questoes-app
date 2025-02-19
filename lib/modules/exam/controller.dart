import 'package:flutter/foundation.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/modules/exam/repository.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class ExamController with ChangeNotifier {
  final ExamRepository repository;

  ExamController() : repository = getIt<ExamRepository>();

  Future<Either<AppError, Exam>> fetchExam(year) async {
    final Either<AppError, Exam> result = await repository.fetchExam(year);
    return result;
  }
}
