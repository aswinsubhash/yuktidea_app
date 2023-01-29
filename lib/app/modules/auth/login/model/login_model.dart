class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"] ,
        message: json["message"] ,
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        accessToken: json["access_token"] ?? '',
        tokenType: json["token_type"] ?? '',
        expiresIn: json["expires_in"] ?? '',
      );
}
