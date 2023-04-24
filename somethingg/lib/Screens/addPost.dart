import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:somethingg/Resourses/fireStoreMethods.dart';
import 'package:somethingg/Resourses/storage_images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:somethingg/Providers/user_provider.dart';
import 'package:somethingg/Models/users.dart' as model;
import 'package:somethingg/Utilities/colors.dart';
import 'package:somethingg/Utilities/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();
  ClearScreen(){
     setState(() {
       _file = null;
     });
  }
  UploadPost(String uid, String username, String profile) async {
    try {
      setState(() {
        isLoading = true;
      });
      String result = await FirestoreMethods().UploadImage(
          username, _file!, uid, _descriptionController.text, profile);
      if (result == "success") {
        setState(() {
          isLoading = false;
        });
        ClearScreen();
        showSnackbar("Image has been posted!!", context);
      } else {
        showSnackbar(result, context);
      }
    } catch (error) {
      showSnackbar(error.toString(), context);
    }
  }

  SelectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Add post"),
            children: [
              SimpleDialogOption(
                padding: EdgeInsets.all(10),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
                child: Text("Take a picture"),
              ),
              SimpleDialogOption(
                padding: EdgeInsets.all(10),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
                child: Text("Choose from gallery"),
              ),
              SimpleDialogOption(
                child: Text("Cancel"),
                padding: EdgeInsets.all(10),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Scaffold(
            backgroundColor: mobileBackgroundColor,
            body: Center(
              child: IconButton(
                icon: Icon(
                  Icons.upload,
                  size: 50,
                  color: Colors.white,
                ),
                onPressed: () {
                  SelectImage(context);
                },
              ),
            ),
          )
        : Scaffold(
            backgroundColor: mobileBackgroundColor,
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  ClearScreen();
                },
              ),
              title: Text("Post to"),
              actions: [
                TextButton(
                    onPressed: () async {
                      await UploadPost(user.uId, user.username, user.url);
                    },
                    child: Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  isLoading
                      ? const LinearProgressIndicator()
                      : Container(),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          backgroundColor: mobileBackgroundColor,
                          radius: 30, backgroundImage: NetworkImage(user.url)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _descriptionController,
                          decoration: InputDecoration(
                              hintText: "Add caption....",
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none),
                          maxLines: 5,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: AspectRatio(
                          aspectRatio: 487 / 457,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(_file!), fit: BoxFit.fill),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
