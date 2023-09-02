import 'package:biometrics/Screens/LoginPage.dart';
import 'package:biometrics/Screens/UserPage.dart';
import 'package:biometrics/Screens/signupPage.dart';
import 'package:biometrics/models/userModel.dart';
import 'package:biometrics/provider/authentication.dart';
import 'package:biometrics/provider/db_provider.dart';
import 'package:biometrics/widgets/Snackbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:biometrics/colors.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _authenticated = false;
  final _firestore = FirebaseFirestore.instance;
  final _authh = FirebaseAuth.instance;



  @override
  void initState() {
    Biometrics().hasBiometrics();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: colorss().secondarycolor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(20.0.sp),
                    child: Container(
                      color: colorss().secondarycolor,
                      child: Container(
                        padding: EdgeInsets.all(15.sp),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colorss().primarycolor),
                        child: Center(
                          child: Lottie.asset("animations/5.json",height: 20.h,)  //1 box
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    width: double.infinity,
                    color: colorss().secondarycolor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Lottie.asset("animations/6.json",height: 20.h),  //second anima
                        SizedBox(
                          height: 0.2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(colorss().fontcolor)),
                                onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                            }, child: Text("Login")),  //login/signup
                            SizedBox(
                              width: 4.0.h,
                            ),
                            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(colorss().fontcolor,)),
                                onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                            }, child: Text("Signup"))
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        InkWell(
                            onTap: () async{
                              _authenticated= await Biometrics().authenticate();
                              if(_authenticated){
                                DocumentSnapshot snap =await _firestore.collection('users').doc(_authh.currentUser!.uid).get();
                                Userr user = Userr().fromSnap(snap);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>UserPage(name: user.name!, email: user.email!)));
                              }
                            },
                            child: Text(
                              "Login via Biometrics?",
                              style: GoogleFonts.nunito(
                                  color: colorss().primarycolor,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 20.h,
                            autoPlay: true,
                          ),
                          items: [
                            Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1.5.w),
                                  image: DecorationImage(fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://media.istockphoto.com/id/1168365129/photo/authentication-by-facial-recognition-concept-biometric-security-system.jpg?s=612x612&w=0&k=20&c=PYcoBVyeVF5CNR4m6BAWbteF3Cvo2DxOURHMYGglTx0="))),
                            ),
                            Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1.5.w),
                                  image: DecorationImage(fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://media.istockphoto.com/id/1306996399/photo/woman-using-fingerprint-indentification-to-personal-access-biometrics-security-e-kyc.jpg?b=1&s=170667a&w=0&k=20&c=Gh7FyAGybV-orNVc9-aNLpomBEMU1QP8bjW8teZF-M4="))),
                            ),
                            Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1.5.w),
                                  image: DecorationImage(fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://d1sr9z1pdl3mb7.cloudfront.net/wp-content/uploads/2017/07/09170452/multimodal-biometrics.jpg"))),
                            ),
                            Container(
                              decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1.5.w),
                                  image: DecorationImage(fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://www.flexenable.com/lib/images/100310-biometricauthentication.jpg"))),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
