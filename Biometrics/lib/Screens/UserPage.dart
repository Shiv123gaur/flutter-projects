import 'package:biometrics/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key,required this.name,required this.email}) : super(key: key);
  final  String name;
  final String email;
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorss().secondarycolor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorss().primarycolor,
          title: Text(
            "User Info Page",
            style: GoogleFonts.nunito(color: colorss().fontcolor),
          ),
        ),
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.5.h),
                  color: colorss().fontcolor,
                ),
                child: ListTile(
                  title: Text("Email"),
                  subtitle: Text(widget.email),
                )),
            Container(
                margin: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.5.h),
                  color: colorss().fontcolor,
                ),
                child: ListTile(
                  title: Text("Name"),
                  subtitle: Text(widget.name),
                )),
          ],
        ),
      ),
    );
  }
}
