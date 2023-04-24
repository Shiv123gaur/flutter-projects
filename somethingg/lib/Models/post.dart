import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postid;
  final datePublication;
  final String postUrl;
  final List likes;
  final String profileUrl;

  Post(
      {required this.description,
      required this.uid,
      required this.username,
      required this.postid,
      required this.datePublication,
      required this.postUrl,
      required this.likes,
      required this.profileUrl});

  Map<String ,dynamic> toJson()=>{
      "username"  : username,
      "uid" :uid,
      "postId" :postid,
      "description":description,
       "datePublication" :datePublication,
       "postURL": postUrl,
      "likes" :likes,
     "profileUrl":profileUrl
  };
}
