
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/constants/http.dart';
import 'package:flutter_riverpod_blog_start/dto/auth_request.dart';
import 'package:flutter_riverpod_blog_start/dto/response_dto.dart';
import 'package:flutter_riverpod_blog_start/model/user/user.dart';

// 문법적인 부분

final authRepositoryProvider = Provider<AuthRepository> ((ref) {
  return AuthRepository();
});

class AuthRepository {

  //아래의 친구는 파싱만 하면된다.
  Future<ResponseDTO> fetchJoin(JoinReqDTO joinReqDTO) async {
    // Map<String, dynamic> requestBody = {
    //   "username" : username,
    //   "password" : password,
    //   "email" : email
    // };

    //
    Response response = await dio.post("/join", data: joinReqDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = User.fromJson(responseDTO.data);
    return responseDTO;


     // Response response = await dio.post("/join", data: requestBody);
     // String responseBody = response.data;
     // print(responseBody);
  }

  Future<ResponseDTO> fatchLogin(LoginReqDTO loginReqDTO) async {
    // 1. 통신 시작
    Response response = await dio.post("/login", data: loginReqDTO.toJson());

    // 2. DTO 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = User.fromJson(responseDTO.data);

    // 3. 토큰 받기
    responseDTO.token = response.headers["authorization"].toString();
    return responseDTO;


  }

}