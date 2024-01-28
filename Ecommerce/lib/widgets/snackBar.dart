import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

showSnackBar(String title, String message) {
  Get.snackbar(title, message,
      titleText: Text(
        title,style: GoogleFonts.nunito(fontWeight: FontWeight.bold,color: Colors.white),
      ),
      messageText: Text(message,style: GoogleFonts.nunito(color: Colors.white),),
    backgroundColor: Colors.red,
    snackPosition: SnackPosition.TOP
  );
}
