
import 'package:cricstreamer/data/response/api_response.dart';
import 'package:cricstreamer/models/user_model.dart';
import 'package:cricstreamer/repository/user_repo.dart';
import 'package:cricstreamer/res/routes/route_name.dart';
import 'package:cricstreamer/widgets/show_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  final _userRepo = UserRepo();
  bool _isLoading = false;
  bool _isSignUpLoading = false;
  final headers = {
  'Content-Type': 'application/json'
  };
  
  ApiResponse<UserViewModel> resetPassword = ApiResponse.notCalled();
  ApiResponse<UserViewModel> verifyOtpResponse = ApiResponse.notCalled();
  ApiResponse<UserViewModel> changePasswordResponse = ApiResponse.notCalled();

  bool get isLoading => _isLoading;

  setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isSignUpLoading => _isSignUpLoading;

  setIsSignUpLoading(bool value) {
    _isSignUpLoading = value;
    notifyListeners();
  }

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');

    return UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }

  Future<void>  loginApi(dynamic data, BuildContext context) async {
    try {
      setIsLoading(true);
      const headers = {
        'Content-Type': 'application/json'
      };
      _userRepo.loginApi(data,headers).then((value) async {
        await ShowDialog.show(context,true,"Congratulations","you are successfully logged in.");
        setIsLoading(false);
        saveUser(UserModel(token: value['token'].toString()));
        Navigator.pushNamedAndRemoveUntil(context, RouteName.home,(route) => false);
      }).onError((error, stackTrace) {
        if(kDebugMode){
          print(error.toString());
        }
        setIsLoading(false);
        ShowDialog.show(context,false,"Error","check your email or password again.");
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    try{
      if(kDebugMode){
        print(data.toString());
      }
      setIsSignUpLoading(true);
      const headers = {
        'Content-Type': 'application/json'
      };
      _userRepo.signUpApi(data, headers).then((value)async{
          await ShowDialog.show(context, true, "Congratulation", "your account is successfullly crested.");
          setIsSignUpLoading(false);
          if(kDebugMode){
            print(value.toString());
          }
          // save data in view model using providers
          Navigator.pushNamedAndRemoveUntil(context, RouteName.home,(route) => false);
      }).onError((error, stackTrace) async {
        if(kDebugMode){
          print(error.toString());
        }

          await ShowDialog.show(context, false, "Error", "Check your credentials again.");
          setIsSignUpLoading(false);
      });
    }catch (e){
      throw e;
    }
  }
  
  Future<void> resetPasswordApi( dynamic data, BuildContext context) async {
    try{
      resetPassword = ApiResponse.isLoading();
      notifyListeners();
      _userRepo.resetPassword(data, headers).then((value)async{
        resetPassword = ApiResponse.completed(value);
        notifyListeners();
        await ShowDialog.show(context, true, "Congratulations", "please check your email and enter otp.");
        Navigator.pushNamedAndRemoveUntil(context, RouteName.verify_password,(route) => false);

      }).onError((error, stackTrace)async{
        if(kDebugMode){
          print(error.toString());
        }
        resetPassword = ApiResponse.error(error.toString());
        notifyListeners();
        await ShowDialog.show(context, false, "Error", "Check your credentials again.");
      });
    }catch (e){
      throw e;
    }
  }

  Future<void> verifyOtpApi( dynamic data, BuildContext context) async {
    try{
      verifyOtpResponse = ApiResponse.isLoading();
      notifyListeners();
      _userRepo.verifyOtp(data, headers).then((value)async{
        verifyOtpResponse = ApiResponse.completed(value);
        notifyListeners();
        await ShowDialog.show(context, true, "Congratulations", "Your otp is verified.");
        Navigator.pushNamedAndRemoveUntil(context, RouteName.change_password,(route) => false);

      }).onError((error, stackTrace)async{
        if(kDebugMode){
          print(error.toString());
        }
        verifyOtpResponse = ApiResponse.error(error.toString());
        notifyListeners();
        await ShowDialog.show(context, false, "Error", "Check your otp again.");
      });
    }catch (e){
      throw e;
    }
  }

  Future<void> changePasswordApi( dynamic data, BuildContext context) async {
    try{
      changePasswordResponse = ApiResponse.isLoading();
      notifyListeners();
      _userRepo.changePassword(data, headers).then((value)async{
        changePasswordResponse = ApiResponse.completed(value);

        if(kDebugMode){
          print(value.toString());
        }
        notifyListeners();
        await ShowDialog.show(context, true, "Congratulations", "Your password is changed.");
        Navigator.pushNamedAndRemoveUntil(context, RouteName.login,(route) => false);
      }).onError((error, stackTrace)async{
        if(kDebugMode){
          print(error.toString());
        }
        changePasswordResponse = ApiResponse.error(error.toString());
        notifyListeners();
        await ShowDialog.show(context, false, "Error", "Check your password again.");
      });
    }catch (e){
      throw e;
    }
  }
}
