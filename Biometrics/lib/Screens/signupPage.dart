import 'package:biometrics/colors.dart';
import 'package:biometrics/widgets/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isSpinnning = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _Email = TextEditingController(text: "");
  TextEditingController _password = TextEditingController(text: "");
  TextEditingController _name = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorss().primarycolor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: colorss().fontcolor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: colorss().primarycolor,
        title: Text(
          "SignUp",
          style: GoogleFonts.nunito(color: colorss().fontcolor),
        ),
      ),
      body: isSpinnning == true
          ? Center(
              child: Lottie.asset("animations/1.json"),
            )
          : ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20.sp),
                  child: Column(
                    children: [
                      Lottie.asset("animations/2.json",height: 30.h),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          padding: EdgeInsets.all(15.sp),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: colorss().secondarycolor,
                                    borderRadius:
                                        BorderRadius.circular(10.vmax)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(15.sp),
                                      hintText: "Enter your Email",
                                      focusedBorder: InputBorder.none),
                                  cursorColor: colorss().primarycolor,
                                  controller: _Email,
                                ),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: colorss().secondarycolor,
                                    borderRadius:
                                        BorderRadius.circular(10.vmax)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(15.sp),
                                      hintText: "Enter your Password",
                                      focusedBorder: InputBorder.none),
                                  cursorColor: colorss().primarycolor,
                                  controller: _password,
                                ),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: colorss().secondarycolor,
                                    borderRadius:
                                        BorderRadius.circular(10.vmax)),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(15.sp),
                                      hintText: "Enter your name",
                                      focusedBorder: InputBorder.none),
                                  cursorColor: colorss().primarycolor,
                                  controller: _name,
                                ),
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              TextButton(
                                onPressed: () async {
                                  setState(() {
                                    isSpinnning = true;
                                  });
                                  if (_Email.text == "" ||
                                      _password.text == "" ||
                                      _name.text == "") {
                                    print("Enter all the details properly");
                                  } else {
                                    UserCredential cred = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: _Email.text,
                                            password: _password.text);
                                    print(
                                        "This is the email${cred.user!.email}");
                                    //print("This is the email${cred.user!.}");
                                    await _firestore
                                        .collection("users")
                                        .doc(cred.user!.uid)
                                        .set({
                                      'email': _Email.text,
                                      'password': _password.text,
                                      'name': _name.text,
                                    });
                                    _Email.clear();
                                    _password.clear();
                                    _name.clear();
                                    setState(() {
                                      isSpinnning = false;
                                    });
                                    ShowSnackBar(
                                        context, "User Created Successfully");
                                  }
                                },
                                child: isSpinnning
                                    ? CircularProgressIndicator()
                                    : Text(
                                        "Singup",
                                        style: GoogleFonts.nunito(
                                            color: Colors.black),
                                      ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            colorss().fontcolor)),
                              )
                            ],
                          )),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
