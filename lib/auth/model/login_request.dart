
class LoginRequest{
  String email;
  String password;
  String loginType;

  LoginRequest({this.email, this.password, this.loginType});

}
enum LOGIN_TYPE{
  FARMER,BUYER
}