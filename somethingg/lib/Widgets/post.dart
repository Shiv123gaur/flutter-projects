import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:somethingg/Utilities/colors.dart';
import 'package:intl/intl.dart';

class Post extends StatelessWidget {
  final snap;
  const Post({Key? key,required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      color: mobileBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: mobileBackgroundColor,
                  backgroundImage: NetworkImage(
                      snap['profileUrl']),
                ),
                const SizedBox(width: 10,),
                Text(
                  snap['username'],
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: Align(alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.34,
            width: double.infinity,
            child: Image.network(
              snap['postURL'],
              fit: BoxFit.scaleDown,
            ),
          ),
          Row(
            children: [
            //    LikeButton(
            //      countBuilder: ,
            //    ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mode_comment_outlined,
                    size: 28,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    size: 28,
                    color: Colors.white,
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_border,
                        size: 28,
                        color: Colors.white,
                      )),
                ),
              ),
              //adding description and number of comments and likes
            ],
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Expanded(
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('${snap['likes'].length} likes',
                          style: TextStyle(color: Colors.white)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: snap['username'],
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "  ${snap['description']}")
            ])),
          ),
          InkWell(onTap: (){
          },
            child: Container(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Text(
                "20000 comments",
                style: TextStyle(fontSize: 10, color: secondaryColor),
              ),
            ),
          ),
          Container(padding: EdgeInsets.symmetric(horizontal: 8,),
            child: Text(
              DateFormat.yMMMd().format(snap['datePublication'].toDate()),
              style: TextStyle(fontSize: 10, color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
