import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:somethingg/Models/post.dart';
import 'package:somethingg/Resourses/storage_images.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String res = "some error";
  UploadImage(String username, Uint8List file, String uid,String description,String profile)async {
    try{
       String postId = Uuid().v1();
       String PostUrl = await StorageMethods().UploadImage("Posts", file, true);
       Post post = Post(description: description, uid: uid, username: username, postid: postId, datePublication: DateTime.now(), postUrl: PostUrl, likes: [],profileUrl: profile);
       _firebaseFirestore.collection("posts").doc(postId).set(post.toJson());
       return res = "success";
    }catch(error){
       res = error.toString();
    }
    return res;
  }
}
