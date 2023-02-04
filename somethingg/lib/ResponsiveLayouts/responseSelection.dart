import 'package:flutter/material.dart';
import 'package:somethingg/Utilities/dimentionis.dart';



class Response_Selection extends StatelessWidget {
  const Response_Selection({Key? key,required this.Mobile,required this.Web}) : super(key: key);
  final Widget Mobile;
  final Widget Web;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context,Constraints){
       if(Constraints.maxWidth>webScreenSize){
           return Web;
       }else{
         return Mobile;
       }
    });
  }
}
