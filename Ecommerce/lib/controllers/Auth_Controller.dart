

import 'package:ecommerce/models/SingupBody.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import '../data/repositories/Auth_repo.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool isLoading = false;
  bool get isloading => isLoading;
  Registration(signUpBody object) async {
    isLoading = true;
    https.Response response  = await authRepo.Registration(object);
    if(response.statusCode == 200){
        isLoading = false;
        authRepo.SaveUserToken(response.body.toString());
    }else{

    }
  }
}