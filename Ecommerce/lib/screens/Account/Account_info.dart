import 'package:ecommerce/utils/dimentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Account_Info extends StatelessWidget {
  const Account_Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white30,
      appBar: AppBar(title: Text("Profile"),centerTitle: true,backgroundColor: Colors.greenAccent,),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage("images/profile.jpeg"), fit: BoxFit.fitHeight)),
                ),
              ),
              SizedBox(height: dimentions.height10,),
              Expanded(flex: 4,
                  child:SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0,2),
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(height: dimentions.height20*3,width: dimentions.width20*4,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: AssetImage("images/profile.jpeg"), fit: BoxFit.cover)),
                            ),
                            SizedBox(width: dimentions.width10,),
                            Text("Shiv Gaur",style: GoogleFonts.nunito(fontSize:25 ),)
                          ],),
                      ),
                      SizedBox(height: dimentions.height20,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0,2),
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Row(children: [
                          Container(height: dimentions.height20*3,width: dimentions.width20*4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                image: DecorationImage(
                                    image: AssetImage("images/mobile.png"), fit: BoxFit.cover)),
                          ),
                          SizedBox(width: dimentions.width10,),
                          Text("7620855695",style: GoogleFonts.nunito(fontSize:25 ),)
                        ],),
                      ),
                      SizedBox(height: dimentions.height20,),
                      Container(
                        padding: EdgeInsets.all(dimentions.height10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0,2),
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Row(children: [
                          Container(height: dimentions.height20*3,width: dimentions.width20*4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                image: DecorationImage(
                                    image: AssetImage("images/email.png"), fit: BoxFit.cover)),
                          ),
                          SizedBox(width: dimentions.width10,),
                          Text("shiv123gaur@gmail.com",style: GoogleFonts.nunito(fontSize:25 ),)
                        ],),
                      ),
                      SizedBox(height: dimentions.height20,),
                      Container(
                        padding: EdgeInsets.all(dimentions.height10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0,2),
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Row(children: [
                          Container(height: dimentions.height20*3,width: dimentions.width20*4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                image: DecorationImage(
                                    image: AssetImage("images/location.png"), fit: BoxFit.cover)),
                          ),
                          SizedBox(width: dimentions.width10,),
                          Text("Sukhsagar nagar katraj",style: GoogleFonts.nunito(fontSize:25 ),)
                        ],),
                      ),
                      SizedBox(height: dimentions.height20,),
                      Container(
                        padding: EdgeInsets.all(dimentions.height10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(0,2),
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Row(children: [
                          Container(
                            height: dimentions.height20*3,width: dimentions.width20*4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                image: DecorationImage(
                                    image: AssetImage("images/message.png"), fit: BoxFit.cover)),
                          ),
                          SizedBox(width: dimentions.width10,),
                          Text("none",style: GoogleFonts.nunito(fontSize:25 ),)
                        ],),
                      ),
                      SizedBox(height: dimentions.height20,),
                      Container(
                        padding: EdgeInsets.all(dimentions.height10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  offset: Offset(2,0),
                                  color: Colors.grey
                              )
                            ]
                        ),
                        child: Row(children: [
                          Container(
                            height: dimentions.height20*3,width: dimentions.width20*4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                image: DecorationImage(
                                    image: AssetImage("images/logout.jpg"), fit: BoxFit.cover)),
                          ),
                          SizedBox(width: dimentions.width10,),
                          Text("Logout",style: GoogleFonts.nunito(fontSize:25 ),)
                        ],),
                      )
                    ],),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
