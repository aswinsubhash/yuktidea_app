class OtpVerificationModel {
  OtpVerificationModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) =>
      OtpVerificationModel(
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
    this.phoneVerifiedAt,
  });

  String? phone;
  DateTime? phoneVerifiedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        phone: json["phone"],
        phoneVerifiedAt: json["phone_verified_at"] == null
            ? null
            : DateTime.parse(json["phone_verified_at"]),
      );
}
