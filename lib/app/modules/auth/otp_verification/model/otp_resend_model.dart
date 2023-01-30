class OtpResendModle {
  OtpResendModle({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory OtpResendModle.fromJson(Map<String, dynamic> json) => OtpResendModle(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );
}

class Datum {
  Datum({
    this.phone,
  });

  String? phone;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        phone: json["phone"],
      );
}
