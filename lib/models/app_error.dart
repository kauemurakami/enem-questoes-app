class AppError {
  Error? error;

  AppError({
    this.error,
  });

  factory AppError.fromJson(Map<String, dynamic> json) => AppError(
        error: Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error!.toJson(),
      };
}

class Error {
  String? code;
  String? message;
  String? docUrl;

  Error({
    this.code,
    this.message,
    this.docUrl,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
        docUrl: json["docUrl"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "docUrl": docUrl,
      };
}
