import 'package:flutter/material.dart';
import 'package:somethingg/Providers/user_provider.dart';
import 'package:somethingg/Utilities/dimentionis.dart';
import 'package:provider/provider.dart';




class Response_Selection extends StatefulWidget {
  const Response_Selection({Key? key,required this.Mobile,required this.Web}) : super(key: key);
  final Widget Mobile;
  final Widget Web;

  @override
  State<Response_Selection> createState() => _Response_SelectionState();
}
class _Response_SelectionState extends State<Response_Selection> {
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData()async{
    UserProvider _userprovider = Provider.of(context,listen: false);
    print("method initiated");
    await _userprovider.refreshUser();
    print("method completed !!");
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder:(context,Constraints){
       if(Constraints.maxWidth>webScreenSize){
           return widget.Web;
       }else{
         return widget.Mobile;
       }
    });
  }
}
