import 'package:ecommerce/widgets/AppTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ecommerce/utils/dimentions.dart';

class SignIn_Page extends StatefulWidget {
  const SignIn_Page({Key? key}) : super(key: key);

  @override
  State<SignIn_Page> createState() => _SignIn_PageState();
}
TextEditingController phone =TextEditingController();
TextEditingController passward = TextEditingController();

class _SignIn_PageState extends State<SignIn_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(dimentions.width20),
            child: Column(
              children: [
                Center(child: Lottie.asset("lottie/signin.json",height: dimentions.height160)),
                SizedBox(height: dimentions.height50,),
                Align(alignment: Alignment.centerLeft,
                  child: Container(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("HELLO",style: GoogleFonts.nunito(fontWeight: FontWeight.w900,fontSize:dimentions.height50),),
                      Text("Sign to your account",style: GoogleFonts.nunito(fontSize: dimentions.height20),),
                    ],),
                  ),
                ),
                SizedBox(height: dimentions.height30,),
                App_TextField(controller: phone, hint: "Phone", icon: Icons.phone,radius: dimentions.radius20,),
                SizedBox(height: dimentions.height20,),
                App_TextField(controller: passward, hint: "Passward", icon: Icons.password,radius: dimentions.radius20,),
                SizedBox(height: dimentions.height10,),
                Align(alignment: Alignment.centerRight,child: Container(child: Text("Sign into your account",style: GoogleFonts.numans(fontSize: dimentions.height5*3),))),
                SizedBox(height: dimentions.height20,),
                Container(width: dimentions.height160,padding: EdgeInsets.all(dimentions.height10),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(dimentions.radius20)
                  ),
                  child:Center(child: Text("Sign In",style: GoogleFonts.nunito(fontSize: dimentions.height30),)),),
                SizedBox(height: dimentions.height20,),
                SvgPicture.asset("images/google.svg"),
                SizedBox(height: dimentions.height10,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have and account?",style: GoogleFonts.nunito(),),
                    Text("Create",style: GoogleFonts.nunito(fontWeight: FontWeight.bold),),
                  ],)
              ],
            ),
          ),)
      ),
    );
  }
}

