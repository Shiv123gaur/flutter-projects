import 'package:ecommerce/widgets/Small_text.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/utils/dimentions.dart';
import 'package:ecommerce/widgets/mediumText.dart';


class ExpandedText extends StatefulWidget {
  const ExpandedText({Key? key,required this.text}) : super(key: key);
   final text;
  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}
bool hidden = false;
late String firstHalf;
late String secondHalf;

int maxheight = 200;
class _ExpandedTextState extends State<ExpandedText> {
  @override
  void initState() {
    if(widget.text.length>maxheight){
      hidden = true;
      firstHalf = widget.text.substring(0,maxheight);
      secondHalf = widget.text.substring(maxheight+1,widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty?SmallFont(text: firstHalf):Column(children: [
      MediumText(
          text:hidden? (firstHalf+"...."):(firstHalf+secondHalf)
      ),
      InkWell(
        onTap: (){
          setState(() {
            hidden = !hidden;
          });
        },
        child: Row(children: [
          Text("Show more"),
          hidden?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up_outlined)
        ],),
      )
    ],);
  }
}
