import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:questoes_enem/models/app_error.dart';
import 'package:questoes_enem/models/either.dart';

Future<Either<AppError, http.Response>> handleHttpExceptions(Future<http.Response> Function() request) async {
  try {
    final response = await request();

    return Either.right(response);
  } on SocketException catch (_) {
    return Either.left(AppError(error: Error(code: 'SocketException', message: 'Problema de conexão com a internet.')));
  } on HttpException catch (_) {
    return Either.left(AppError(error: Error(code: 'HttpException', message: 'Erro ao tentar acessar o servidor.')));
  } on FormatException catch (_) {
    return Either.left(AppError(error: Error(code: 'FormatException', message: 'Erro ao processar a resposta.')));
  } on TimeoutException catch (_) {
    return Either.left(AppError(error: Error(code: 'TimeoutException', message: 'Tempo de requisição excedido.')));
  } catch (e) {
    return Either.left(
        AppError(error: Error(code: 'Erro inesperado.', message: 'Ocorreu um erro inesperado, tente novamente')));
  }
}
