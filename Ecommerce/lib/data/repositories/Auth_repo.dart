import 'package:ecommerce/models/SingupBody.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/utils/project_constanst.dart';
import '../api/client_api.dart';
import 'package:http/http.dart' as https;

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});
  
  
  Future<https.Response> Registration(signUpBody body)async{
    return await apiClient.postData(AppConstants.AUTHORIZATION,body.toJson());
  }

  SaveUserToken(String token)async{
     apiClient.token  = token;
     apiClient.updateHeaders(token);
     await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
