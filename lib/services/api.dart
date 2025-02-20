import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';
import 'package:questoes_enem/models/exam.dart';
import 'package:questoes_enem/utils/functions/handle_http_exceptions.dart';

const baseUrl = 'https://api.enem.dev/v1';

class ApiService {
  Future<Either<AppError, List<Exam>>> fetchExams() async {
    final Either<AppError, http.Response> response = await handleHttpExceptions(
      () async => await http.get(
        Uri.parse('$baseUrl/exams'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );

    return response.fold((AppError error) => Either.left(error), (http.Response res) {
      if (res.statusCode == 200 || res.statusCode == 201) {
        return Either.right(examFromJson(res.body));
      }
      return Either.left(AppError.fromJson(json.decode(res.body)));
    });
  }

  Future<Either<AppError, Exam>> fetchExam(String year) async {
    final Either<AppError, http.Response> response = await handleHttpExceptions(
      () async => await http.get(
        Uri.parse('$baseUrl/exams/$year'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );

    return response.fold((AppError error) => Either.left(error), (http.Response res) {
      if (res.statusCode == 200 || res.statusCode == 201) {
        return Either.right(
          Exam.fromJson(
            json.decode(utf8.decode(res.bodyBytes)),
          ),
        );
      }
      return Either.left(AppError.fromJson(json.decode(res.body)));
    });
  }
}
