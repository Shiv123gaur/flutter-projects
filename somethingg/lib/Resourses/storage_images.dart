import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods{
   FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth  = FirebaseAuth.instance;
  Future<String> UploadImage(String childName,Uint8List file,bool isPost)async{
        Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);
        UploadTask task = ref.putData(file);
        TaskSnapshot snap =await task;
        String downloadedURL = await snap.ref.getDownloadURL();
        return downloadedURL;
  }
}