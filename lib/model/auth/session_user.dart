
import 'package:flutter_riverpod_blog_start/model/user/user.dart';


// 디폴트 세션값
// 최초 앱이 실해될 떄 초기화 되어야 함.
// 1. Jwt 존재 유무 확인 (I/O)
// 2. Jwt 로 회원정보 받아옴 (I/O)
// 3. Ok -> loginSuccess() 호출
// 4. FAIL -> loginPage로 이동
class SessionUser {
  User? user;
  String? jwt;
  bool? isLogin;


  // 이 토큰이 유효한지 확인
  void loginSuccess() {
    this.user = user;
    this.jwt = jwt;
    this.isLogin = true;
  }

  void logoutSuccess() {
    this.user = null;
    this.jwt =  null;
    this.isLogin = false;
  }
}