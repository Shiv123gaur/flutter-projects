import 'dart:convert';

import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/helper/dependencies.dart';
import 'package:ecommerce/models/cartModel.dart';
import 'package:ecommerce/utils/dimentions.dart';
import 'package:ecommerce/utils/project_constanst.dart';
import 'package:ecommerce/widgets/appIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../routes/routes_helper.dart';
import '../../widgets/Big_text.dart';

class History extends StatefulWidget {
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {


  @override
  Widget build(BuildContext context) {
    List<int> ItemsPerOrder = [];
    Map<String, int> listperorder = Map();
    var gethistoryList = Get.find<CartController>().getHistory();
    for (int i = 0; i < gethistoryList.length; i++) {
      if (listperorder.containsKey(gethistoryList[i].time)) {
        listperorder.update(gethistoryList[i].time!, (value) => ++value);
      } else {
        listperorder.putIfAbsent(gethistoryList[i].time!, () => 1);
      }
    }
    List<int> NumberOfitemsPerorder() {
      return listperorder.entries.map((e) => e.value).toList();
    }
    List<String> TimeperOrder(){
      return listperorder.entries.map((e) => e.key).toList();
    }
    ItemsPerOrder = NumberOfitemsPerorder();
    var count = 0;
    return gethistoryList.length>0
        ?Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.greenAccent,
              height: dimentions.height100,
              width: double.maxFinite,
              padding: EdgeInsets.only(top: dimentions.height50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigFont(
                    text: "Cart History",
                  ),
                  AppIcon(
                    iconbackground: Icons.circle,
                    icontop: Icons.shopping_cart_rounded,
                    colorr: Colors.yellow,
                  )
                ],
              )),
          Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (int i = 0; i < listperorder.length; i++)
                      Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2),borderRadius: BorderRadius.circular(dimentions.radius10)),
                        padding: EdgeInsets.all(dimentions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (() {
                              DateTime parsedTime =
                              DateFormat("yyyy-MM-dd HH:mm:ss")
                                  .parse(gethistoryList[count].time!);
                              var inputDate = DateTime.parse(parsedTime.toString());
                              var outputFormat = DateFormat("dd/MM/yyyy hh:mm a");
                              var outputDate = outputFormat.format(inputDate);
                              return Text(outputDate);
                            }()),
                            SizedBox(
                              height: dimentions.radius10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(ItemsPerOrder[i],
                                            (index) {
                                          if (count < gethistoryList.length) {
                                            ++count;
                                            print("This is the length ${gethistoryList.length} and this is the count $count");
                                          }
                                          return index <= 2
                                              ? Container(
                                            margin: EdgeInsets.only(
                                                left: dimentions.width5),
                                            height: dimentions.height160/2,width: dimentions.height160/2,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    dimentions.radius10),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        AppConstants
                                                            .BASE_URL +
                                                            "/uploads/" +
                                                            gethistoryList[
                                                            count - 1]
                                                                .img!),
                                                    fit: BoxFit.cover)),
                                          )
                                              : Container();
                                        })),
                                Container(
                                  padding: EdgeInsets.only(right:dimentions.width10),
//height: dimentions.height160/2,width: dimentions.height160/2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("Total"),
                                      SizedBox(
                                        height: dimentions.width5,
                                      ),
                                      BigFont(text: ItemsPerOrder[i].toString()),

                                      Container(

                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                dimentions.radius10 / 2)),
                                        height:dimentions.height30,
                                        width:dimentions.width20*3,
                                        child: GestureDetector(onTap: (){
                                          var TimePerOrder = TimeperOrder();
                                          Map<int,CartModel> moreOrder = {};
                                          for(int j=0;j<gethistoryList.length;j++){
                                            if(gethistoryList[j].time==TimePerOrder[i]){
                                              moreOrder.putIfAbsent(gethistoryList[j].product!.id!,() =>
                                                  CartModel.fromJson(jsonDecode(jsonEncode(gethistoryList[j]))),
                                              );
                                            }
                                            Get.find<CartController>().cartPage = moreOrder;
                                            Get.find<CartController>().addToSharedpreferences();
                                          }
                                        },
                                            child: Center(child: Text("Again?"))),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ))
        ],
      ),
    )
        :Scaffold(backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.toNamed(Routes.go_to_home());
            }, child: Text("Add some items?"),style: ElevatedButton.styleFrom(backgroundColor: Colors.red,elevation: dimentions.width30),),
            SizedBox(height: dimentions.height50,),
            Container(height: dimentions.width150*2,width:dimentions.width150*2,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/empty catt.png"),fit: BoxFit.fill)),
            ),
            SizedBox(height: dimentions.height50,),
            Text("There is no history yet!!!",style: GoogleFonts.nunito(fontSize: 20),),
          ],
        ),
      ),);
  }
}






































//
//

