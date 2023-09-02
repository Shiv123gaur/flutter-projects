
import 'package:ecommerce/screens/Home/food_page_body.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/dimentions.dart';
import 'package:ecommerce/widgets/Big_text.dart';
import 'package:ecommerce/widgets/Small_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeFoodPage extends StatefulWidget {
  const HomeFoodPage({Key? key}) : super(key: key);

  @override
  State<HomeFoodPage> createState() => _HomeFoodPageState();
}

class _HomeFoodPageState extends State<HomeFoodPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(dimentions.screenHeight);
    print(dimentions.screenWidth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.only(top: dimentions.height10,bottom: dimentions.height10,left: dimentions.width10,right: dimentions.width10),
                margin: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigFont(text: "INDIA",color: Col.primaryColor,),
                        Row(
                          children: [
                            SmallFont(text: "pune",color: Col.QuatanaryColor,),
                            Icon(Icons.arrow_drop_down,size: dimentions.height30,)
                          ],
                        )
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.only(left: dimentions.width5,right: dimentions.width5,top: dimentions.height10,bottom:dimentions.width10),
                      alignment: Alignment.topRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(dimentions.radius10),
                          color: Col.primaryColor),
                      child: Icon(Icons.search,color: Colors.white,size: dimentions.height30,),
                )
                  ],
                ),
              ),
            ),
            Flexible(child: SingleChildScrollView(child: FoodPage())),
          ],
        ),
      ),
    );
  }


}
