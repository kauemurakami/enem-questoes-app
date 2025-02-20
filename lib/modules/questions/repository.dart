import 'package:questoes_enem/services/api.dart';
import 'package:questoes_enem/services/setup_locator.dart';

class QuestionsRepository {
  final ApiService api = getIt<ApiService>();
}
