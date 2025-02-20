// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

import 'dart:convert';

Questions questionsFromJson(String str) => Questions.fromJson(json.decode(str));

String questionsToJson(Questions data) => json.encode(data.toJson());

class Questions {
  Metadata? metadata;
  List<Question>? questions;

  Questions({
    this.metadata,
    this.questions,
  });

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        metadata: Metadata.fromJson(json["metadata"]),
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "metadata": metadata!.toJson(),
        "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
      };
}

class Metadata {
  int? limit;
  int? offset;
  int? total;
  bool? hasMore;

  Metadata({
    this.limit,
    this.offset,
    this.total,
    this.hasMore,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        limit: json["limit"],
        offset: json["offset"],
        total: json["total"],
        hasMore: json["hasMore"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "total": total,
        "hasMore": hasMore,
      };
}

class Question {
  String? title;
  int? index;
  String? discipline;
  String? language;
  int? year;
  String? context;
  List<String>? files;
  String? correctAlternative;
  String? alternativesIntroduction;
  List<Alternative>? alternatives;

  Question({
    this.title,
    this.index,
    this.discipline,
    this.language,
    this.year,
    this.context,
    this.files,
    this.correctAlternative,
    this.alternativesIntroduction,
    this.alternatives,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        title: json["title"],
        index: json["index"],
        discipline: json["discipline"],
        language: json["language"],
        year: json["year"],
        context: json["context"],
        files: json["files"] == null ? null : List<String>.from(json["files"].map((x) => x)),
        correctAlternative: json["correctAlternative"],
        alternativesIntroduction: json["alternativesIntroduction"],
        alternatives: json["alternatives"] == null
            ? null
            : List<Alternative>.from(json["alternatives"].map((x) => Alternative.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "index": index,
        "discipline": discipline,
        "language": language,
        "year": year,
        "context": context,
        "files": List<dynamic>.from(files!.map((x) => x)),
        "correctAlternative": correctAlternative,
        "alternativesIntroduction": alternativesIntroduction,
        "alternatives": List<dynamic>.from(alternatives!.map((x) => x.toJson())),
      };
}

class Alternative {
  String? letter;
  String? text;
  String? file;
  bool? isCorrect;

  Alternative({
    this.letter,
    this.text,
    this.file,
    this.isCorrect,
  });

  factory Alternative.fromJson(Map<String, dynamic> json) => Alternative(
        letter: json["letter"],
        text: json["text"],
        file: json["file"],
        isCorrect: json["isCorrect"],
      );

  Map<String, dynamic> toJson() => {
        "letter": letter,
        "text": text,
        "file": file,
        "isCorrect": isCorrect,
      };
}
