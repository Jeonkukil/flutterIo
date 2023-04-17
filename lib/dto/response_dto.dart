import 'package:flutter/material.dart';

class ResponseDTO {
  final int? code;
  final String? msg;
  String? token;
  dynamic data; // JsonArray [], JsonObject {}

  // 다이나믹으로 받는 이유:
  // 통신은 Json -> dio가 map으로 받아준다.
  // map으로 받은걸 자신의 오브젝트로 변환해야한다.
  // 오브젝트가 어떤건지는 그때 그때 다르다. var로 정의하면 들어오는 오브젝트로 받기 힘들다.
  // 다이나믹으로 받고 그떄그떄 파싱하는게 편하다.

  ResponseDTO({
    this.code,
    this.msg,
    this.data,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}