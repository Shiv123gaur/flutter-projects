import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:somethingg/Resourses/authentication.dart';
import 'package:somethingg/ResponsiveLayouts/mobileResponse.dart';
import 'package:somethingg/ResponsiveLayouts/responseSelection.dart';
import 'package:somethingg/ResponsiveLayouts/webResponse.dart';
import 'package:somethingg/Screens/SignupScreen.dart';
import 'package:somethingg/Utilities/colors.dart';
import 'package:somethingg/Utilities/utils.dart';
import 'package:somethingg/Widgets/textField.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  final TextEditingController _passEditingController = TextEditingController();
  String result = 'some error';
  bool _isLoading = false;
  void dispose() {
    _passEditingController.dispose();
    _textEditingController.dispose();
  }

  void SignInUser() async {
    setState(() {
      _isLoading = true;
    });
    result = await Authentication().SinginUser(
        Email: _textEditingController.text,
        Passward: _passEditingController.text);
    if (result == "success") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Response_Selection(
              Mobile: MobileResponse(), Web: WebResponse())));
    } else {
      showSnackbar(result, context);
    }
    setState(() {
      _isLoading = false;
    });
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
              height: 20,
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
            TextButton(
                onPressed: SignInUser,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  elevation: 10,
                ),
                child: InkWell(
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
                              "Login",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ))),
                )),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Do you have an account ? ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  },
                  child: Container(
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
