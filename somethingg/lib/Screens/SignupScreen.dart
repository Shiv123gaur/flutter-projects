import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:somethingg/Resourses/authentication.dart';
import 'package:somethingg/ResponsiveLayouts/mobileResponse.dart';
import 'package:somethingg/ResponsiveLayouts/responseSelection.dart';
import 'package:somethingg/ResponsiveLayouts/webResponse.dart';
import 'package:somethingg/Utilities/colors.dart';
import 'package:somethingg/Utilities/utils.dart';
import 'package:somethingg/Widgets/textField.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  final TextEditingController _passEditingController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _bioController = TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _passEditingController.dispose();
    _userNameController.dispose();
    _bioController.dispose();
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  signup() async {
    setState(() {
      _isLoading = true;
    });
    String res = await Authentication().SignUp(
        email: _textEditingController.text,
        passward: _passEditingController.text,
        username: _userNameController.text,
        bio: _bioController.text,
        file: _image!);
    setState(() {
      _isLoading = false;
    });
    if (res != "success") {
      showSnackbar(res, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Response_Selection(
                Mobile: MobileResponse(),
                Web: WebResponse(),
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            SvgPicture.asset(
              'assets/images/logo1.svg',
              color: Colors.white,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(children: [
              _image != null
                  ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : CircleAvatar(
                      radius: 64,
                      child: Image(
                        image: AssetImage('no_image.png'),
                      ),
                    ),
              Positioned(
                  left: 80,
                  bottom: -5,
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 40,
                    onPressed: () {
                      selectImage();
                    },
                    icon: Icon(Icons.add_a_photo),
                  ))
            ]),
            const SizedBox(
              height: 25,
            ),
            textField(
                hint: "Enter User Name",
                keyBoard: TextInputType.text,
                controller: _userNameController),
            const SizedBox(
              height: 10,
            ),
            textField(
              hint: "Enter the email",
              keyBoard: TextInputType.emailAddress,
              controller: _textEditingController,
            ),
            const SizedBox(
              height: 10,
            ),
            textField(
              hint: "Enter the Passward",
              ispass: true,
              keyBoard: TextInputType.number,
              controller: _passEditingController,
            ),
            const SizedBox(
              height: 10,
            ),
            textField(
                hint: "Enter your bio",
                keyBoard: TextInputType.text,
                controller: _bioController),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: signup,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  elevation: 10,
                ),
                child: Container(
                    decoration: BoxDecoration(
                      color: blueColor,
                    ),
                    padding: EdgeInsets.all(10),
                    //width: 200,
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : Center(
                            child: Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          )))),
            Flexible(
              child: Container(),
              flex: 1,
            ),
          ],
        ),
      ),
    ));
  }
}
