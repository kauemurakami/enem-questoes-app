class Question {
  String? title;
  int? index;
  String? discipline;
  String? language;

  Question({
    this.title,
    this.index,
    this.discipline,
    this.language,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        title: json["title"],
        index: json["index"],
        discipline: json["discipline"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "index": index,
        "discipline": discipline,
        "language": language,
      };
}
