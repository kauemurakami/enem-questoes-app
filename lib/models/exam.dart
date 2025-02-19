import 'dart:convert';
import 'package:questoes_enem/models/discipline.dart';
import 'package:questoes_enem/models/question.dart';

List<Exam> examFromJson(String str) => List<Exam>.from(json.decode(str).map((x) => Exam.fromJson(x)));

String examToJson(Exam data) => json.encode(data.toJson());

class Exam {
  String? title;
  int? year;
  List<Discipline>? disciplines;
  List<Discipline>? languages;
  List<Question>? questions;

  Exam({
    this.title,
    this.year,
    this.disciplines,
    this.languages,
    this.questions,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        title: json["title"],
        year: json["year"],
        disciplines: json["disciplines"] == null
            ? null
            : List<Discipline>.from(json["disciplines"].map((x) => Discipline.fromJson(x))),
        languages: json["languages"] == null
            ? null
            : List<Discipline>.from(json["languages"].map((x) => Discipline.fromJson(x))),
        questions:
            json["questions"] == null ? null : List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "year": year,
        "disciplines": List<dynamic>.from(disciplines!.map((x) => x.toJson())),
        "languages": List<dynamic>.from(languages!.map((x) => x.toJson())),
        "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}
