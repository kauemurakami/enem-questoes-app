class Discipline {
  String? label;
  String? value;

  Discipline({
    this.label,
    this.value,
  });

  factory Discipline.fromJson(Map<String, dynamic> json) => Discipline(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}
