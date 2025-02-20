import 'package:flutter/foundation.dart';
import 'package:questoes_enem/modules/questions/repository.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class QuestionsController with ChangeNotifier {
  final QuestionsRepository repository;
  QuestionsController() : repository = getIt<QuestionsRepository>();
}
