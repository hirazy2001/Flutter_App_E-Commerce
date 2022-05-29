class ResponseCode{
  final int code;
  final String status;
  final dynamic? data;

  ResponseCode({required this.code, required this.status, this.data});

   factory ResponseCode.fromJson(Map<String, dynamic> json) =>
       ResponseCode(code: json["code"], status: json["status"], data: json["data"] ?? "");
}