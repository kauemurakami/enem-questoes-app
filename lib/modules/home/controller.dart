import 'package:flutter/foundation.dart';
import 'package:questoes_enem/enums/enem_year.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/modules/home/repository.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class HomeController with ChangeNotifier {
  final HomeRepository repository;
  HomeController() : repository = getIt<HomeRepository>();
  ValueNotifier<EnemYear> selectedYear = ValueNotifier(EnemYear.y2023);

  Future<Either<AppError, Exam>> fetchExam() async {
    final Either<AppError, Exam> result = await repository.fetchExam(selectedYear.value.year);
    return result;
  }

  Future<Either<AppError, List<Exam>>> fetchExams() async {
    final Either<AppError, List<Exam>> result = await repository.fetchExams();
    return result;
  }
}
