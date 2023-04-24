
import 'package:flutter/material.dart';
import 'package:somethingg/Screens/AccoutInfo.dart';
import 'package:somethingg/Screens/addPost.dart';
import 'package:somethingg/Utilities/colors.dart';
import 'package:somethingg/Screens/feed.dart';

class MobileResponse extends StatefulWidget {
  const MobileResponse({Key? key}) : super(key: key);

  @override
  State<MobileResponse> createState() => _MobileResponseState();
}

class _MobileResponseState extends State<MobileResponse> {
  int _currentIndex =0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  void pageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  void onTapped(int page){
     pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(home: SafeArea(
      child: Scaffold(
        backgroundColor: mobileBackgroundColor,
        body: PageView(
          children: [
             FeedScreen(),
             Text("Second page",style: TextStyle(color: Colors.white)),
            PostScreen(),
            Text("Fourth page",style: TextStyle(color: Colors.white)),
            Text("Some info about accout !",style: TextStyle(color: Colors.blueAccent),),
          ],
          controller: pageController,
          onPageChanged:pageChanged ,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(backgroundColor: mobileBackgroundColor,
          type: BottomNavigationBarType.fixed,
          items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 40,color: _currentIndex==0?primaryColor:secondaryColor,),label: '',backgroundColor: primaryColor),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 40,color: _currentIndex==1?primaryColor:secondaryColor,),label: '',backgroundColor: primaryColor),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle,size: 40,color: _currentIndex==2?primaryColor:secondaryColor,),label: '',backgroundColor: primaryColor),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,size: 40,color: _currentIndex==3?primaryColor:secondaryColor,),label: '',backgroundColor: primaryColor),
            BottomNavigationBarItem(icon: Icon(Icons.person,size: 40,color: _currentIndex==4?primaryColor:secondaryColor,),label: '',backgroundColor: primaryColor)
        ],
        currentIndex: _currentIndex,
          onTap: onTapped,
        ),
      ),
    ),);
  }
}
