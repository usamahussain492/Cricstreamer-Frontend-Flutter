
class AppUrl{

  static var baseUrl = 'https://cric-streamer.cyclic.app' ;
  // static var baseUrl = 'http://localhost:5000';
  // static var baseUrl = 'https://reqres.in/';

  // userend points
  static var loginEndPoint =  '$baseUrl/api/user/login' ;
  static var signUpEndPoint = '$baseUrl/api/user/signup';
  static var resetPasswordEndPoint = '$baseUrl/api/user/sendOTP';
  static var verifyOtpEndPoint = '$baseUrl/api/user/signup/verify';
  static var changePasswordEndPoint = '$baseUrl/api/user/changePassword';

}