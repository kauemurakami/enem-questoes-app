import 'package:flutter/foundation.dart';
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/modules/home/repository.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class HomeController with ChangeNotifier {
  final HomeRepository repository;
  HomeController() : repository = getIt<HomeRepository>();

  Future<Either<AppError, List<Exam>>> fetchExams() async {
    final Either<AppError, List<Exam>> result = await repository.fetchExams();
    return result;
  }
}
