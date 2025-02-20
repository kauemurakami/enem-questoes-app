import 'package:get_it/get_it.dart';
import 'package:questoes_enem/modules/exam/repository.dart';
import 'package:questoes_enem/modules/home/repository.dart';
import 'package:questoes_enem/modules/questions/repository.dart';
import 'package:questoes_enem/services/api.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  //services
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  //repositories
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());
  getIt.registerLazySingleton<ExamRepository>(() => ExamRepository());
  getIt.registerLazySingleton<QuestionsRepository>(() => QuestionsRepository());
}
