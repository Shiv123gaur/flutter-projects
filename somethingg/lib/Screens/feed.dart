import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somethingg/Widgets/post.dart';
import 'package:somethingg/Utilities/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: SvgPicture.asset('assets/images/logo1.svg',
          height: 32,color: primaryColor,),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.messenger_outline_outlined)),
        ],
      ),
      body: StreamBuilder(stream:FirebaseFirestore.instance.collection('posts').snapshots() ,
      builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
            if(snapshot.connectionState ==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index)=>Post(snap: snapshot.data!.docs[index].data(),),
            );
        },),
    );
  }
}
