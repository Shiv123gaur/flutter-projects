import 'package:ecommerce/utils/dimentions.dart';
import 'package:ecommerce/widgets/AppTextfield.dart';
import 'package:ecommerce/widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Sign_Up_Page extends StatelessWidget {
  const Sign_Up_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _phone = TextEditingController();
    TextEditingController _name = TextEditingController();

    Register_user(){
      String name = _name.text.trim();
      String phone = _phone.text.trim();
      String email = _email.text.trim();
      String password = _password.text.trim();
      if(name.isEmpty && email.isEmpty && password.isEmpty && phone.isEmpty ){
         showSnackBar("No data", "Please enter the data.");
      } else if(name.isEmpty){
           showSnackBar("null name", "Please provide a name.");
      }else if(phone.isEmpty){
           showSnackBar("null phone", "Please provide phone number");
      }else if(email.isEmpty){
           showSnackBar("null email", "Please provide email.");
      }else if(password.isEmpty){
           showSnackBar("null pass", "Please provide password");
      }else if(password.length<6){
           showSnackBar("Password too small", "Please set a strong password");
      }else if(!email.isEmail){
           showSnackBar("Invalid email", "Please enter a valid email",);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Center(
                  child: Lottie.asset("lottie/animation_lnizkkcw.json",
                      height: dimentions.height100 * 2,
                      width: 200,
                      fit: BoxFit.fill)),
              App_TextField(controller: _email, hint: "Email", icon: Icons.email,radius:dimentions.radius20*3),
              SizedBox(height: dimentions.height10,),
              App_TextField(controller: _password, hint: "Password", icon: Icons.password,radius:dimentions.radius20*3),
              SizedBox(height: dimentions.height10,),
              App_TextField(controller: _phone, hint: "Phone", icon: Icons.phone,radius:dimentions.radius20*3),
              SizedBox(height: dimentions.height10,),
              App_TextField(controller: _name, hint: "Name", icon: Icons.nest_cam_wired_stand,radius:dimentions.radius20*3),
              SizedBox(height: dimentions.height10,),
              SizedBox(height: dimentions.height10,),
              GestureDetector(
                onTap: (){
                  Register_user();
                },
                child: Container(height: dimentions.height20*3,width: dimentions.width20*5,
                  decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: BorderRadius.circular(dimentions.radius20),boxShadow: [BoxShadow(blurRadius: 2,spreadRadius: 2,color: Colors.grey,offset: Offset(2,2))]
                  ),
                  child: Center(child: Text("Sign Up",style: GoogleFonts.nunito(fontSize: 20),)),
                ),
              ),
              SizedBox(height: dimentions.height10,),
              Text("Have an account?",style: GoogleFonts.nunito(fontWeight: FontWeight.bold),),
              SizedBox(height: dimentions.height30,),
              Text("Sign Up using one of the following methonds",style: GoogleFonts.nunito(fontWeight: FontWeight.bold),),
              SizedBox(height: dimentions.height5,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("images/google.svg",height: dimentions.height50,),
                  SizedBox(width: dimentions.width20,),
                  SvgPicture.asset("images/twitter.svg",height: dimentions.height50,),
                  SizedBox(width: dimentions.width20,),
                  SvgPicture.asset("images/facebook.svg",height: dimentions.height50,),
                ],)
            ],
          ),
        )
      ),
    );
  }
}
