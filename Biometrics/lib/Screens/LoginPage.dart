

import 'package:biometrics/Screens/UserPage.dart';
import 'package:biometrics/Screens/setting.dart';
import 'package:biometrics/Screens/signupPage.dart';
import 'package:biometrics/colors.dart';
import 'package:biometrics/models/userModel.dart';
import 'package:biometrics/provider/db_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/Snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSpinning  = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController _emaill = TextEditingController();
  TextEditingController _passwordd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorss().primarycolor,
      appBar: AppBar(
        backgroundColor: colorss().secondarycolor,
        title: Text(
          "Login",
          style:
              GoogleFonts.nunito(fontSize: 22.sp,),
        ),
        centerTitle: true,
      ),
      body: isSpinning==true?Center(child: Lottie.asset("animations/1.json"),):Container(
        width: double.infinity,
        color: colorss().primarycolor,
        child: Padding(
          padding: EdgeInsets.all(0.3.dp),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 5.h,),
                Lottie.asset("animations/3.json",height: 30.h),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: colorss().secondarycolor,
                              borderRadius: BorderRadius.circular(10.vmax)),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15.sp),
                                hintText: "Enter your Email",
                                focusedBorder: InputBorder.none),
                            cursorColor: colorss().primarycolor,
                            controller: _emaill,
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: colorss().secondarycolor,
                              borderRadius: BorderRadius.circular(10.vmax)),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15.sp),
                                hintText: "Enter your Password",
                                focusedBorder: InputBorder.none),
                            cursorColor: colorss().primarycolor,
                            controller: _passwordd,
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () async{
                                setState(() {
                                  isSpinning = true;
                                });
                                if(_emaill.text.isEmpty || _passwordd.text.isEmpty){
                                  ShowSnackBar(context, "Enter all the fields");
                                  setState(() {
                                    isSpinning = false;
                                  });
                                }else{
                                  try{
                                    await _auth.signInWithEmailAndPassword(email: _emaill.text, password: _passwordd.text);
                                    DocumentSnapshot snapshot = await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
                                    Userr user = Userr().fromSnap(snapshot);
                                    setState(() {
                                      isSpinning = false;
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>UserPage(name:user.name!,email: user.email!,)));
                                    });
                                  }catch(error){
                                    ShowSnackBar(context, error.toString());
                                    setState(() {
                                      isSpinning = false;
                                    });
                                  }



                                }
                              },
                              child:  isSpinning ?CircularProgressIndicator():Text(
                                "Login",
                                style: GoogleFonts.nunito(color: Colors.black),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      colorss().fontcolor)),
                            ),
                            SizedBox(width: 5.w,),
                            TextButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignupScreen()));
                            }, child: Text("New to app ?",style: GoogleFonts.nunito(fontWeight: FontWeight.bold,color: Colors.white),))
                          ],
                        )
                      ],
                    )
                ),
                Container(height: 15.h,),
                // Align(alignment: Alignment.bottomRight,
                //   child: Container(decoration: BoxDecoration(color: colorss().thirdColor,borderRadius: BorderRadius.circular(15)),
                //     child: TextButton(child: Text("Setting",style: GoogleFonts.nunito(color: colorss().fontcolor),),onPressed: (){
                //          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Settings()));
                //     },),
                //   ),
                // )
              ],
            ),
          ],),
        ),
      ),
    );
  }
}
