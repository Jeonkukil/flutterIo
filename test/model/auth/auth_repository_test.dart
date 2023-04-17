import 'package:dio/dio.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/model/user/user.dart';

// 요청해서 받은 데이터를 무조건 Dto로 만든다.

//

final dio = Dio(BaseOptions(
    baseUrl: "http://192.168.178.132:8080",
    contentType: "application/json; charset=utf-8"
));

void main() async {
  await fatchLogin_test();
}



Future<void> fatchLogin_test() async {

  // given
  String username = "ssar232";
  String password = "1234";


  Map<String, dynamic> requestBody = {
    "username": username,
    "password": password,
  };




  Response response = await dio.post("/join", data: requestBody);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  responseDTO.data = User.fromJson(responseDTO.data);
  print(responseDTO.code);
  print(responseDTO.msg);
  print(responseDTO.data);

  User user = responseDTO.data;
  print(user.id);
  print(user.email);
  print(user.username);
}





  Future<void> fetchJoin_test1() async {

  // given
  String username = "ssar232";
  String password = "1234";
  String email = "ssar232@nate.com";


  Map<String, dynamic> requestBody = {
    "username": username,
    "password": password,
    "email": email
  };


  // 요청시에는 map을 body에 담기 (dio가 json으로 변경해준다)
  // 응답시에는 Response.data 에  map을 담아줌 (dio가 json을 map으로 변경해서 담아준다.)
  Response response = await dio.post("/join", data: requestBody);
  // print(response.data);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  // print(responseDTO.code);
  // print(responseDTO.msg);
  // print(responseDTO.data);

  responseDTO.data = User.fromJson(responseDTO.data);

  print(responseDTO.code);
  print(responseDTO.msg);
  print(responseDTO.data);

  User user = responseDTO.data;
  print(user.id);
  print(user.email);
  print(user.username);



  // User user = User.fromJson(response.data);
  // print(user.id);
  // print(user.password);
  // print(user.email);
}