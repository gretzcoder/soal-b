import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    bool isLogin = false;
    if (username == 'iqbal' || password == 'iqbal') {
      await UserInfo().setToken("iqbal");
      await UserInfo().setUserID("1");
      await UserInfo().setUsername("iqbal");

      isLogin = true;
    }

    return isLogin;
  }
}
